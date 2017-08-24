class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show]  
  def create
    @attendance = current_subject.attendances.build(attendance_params)
    @attendance.subject_id = current_subject.id
    point1 = [@attendance.latitude, @attendance.longitude]
    point2 = [current_subject.latitude, current_subject.longitude]
    in_circle = Geocoder::Calculations.distance_between(point1, point2) < current_subject.radius
    if in_circle == true
      if @attendance.save!
        render json: @attendance, status: :created   
      else
        head(:unprocessable_entity)
      end
    else
      render json: {faile: 'Не надо так. Вы не в радиусе класса'}, status: :forbidden
    end
  end

  def index
    @attendances = current_subject.attendances.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @attendances, status: :ok}
    end
  end

  def show

  end


  private

    def current_subject
      @current_subject = Subject.find(params[:subject_id])
    end

    def set_attendance
      @subject = current_subject.attendances.find(params[:id])
    end

    def attendance_params
      params.require(:attendance).permit(:first_name, :last_name,:longitude, :latitude, :subject_id)
    end
end
