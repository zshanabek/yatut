class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show]
  before_action :authenticate_user!, except: [:create]
  def create
    @attendance = current_subject.attendances.build(attendance_params)
    @attendance.subject_id = current_subject.id
    point1 = [@attendance.latitude, @attendance.longitude]
    point2 = [current_subject.latitude, current_subject.longitude]
    radius = current_subject.radius
    distance = Geocoder::Calculations.distance_between(point1, point2) * 1000
    in_circle = distance < radius
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
    @attendances = current_subject.attendances.order('created_at DESC')
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
      params.require(:attendance).permit(:first_name, :last_name,:longitude, :latitude, :subject_id, :created_at)
    end
end
