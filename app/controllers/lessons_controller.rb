class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show
      @current_lesson.section.course != current_user.enrolled_in
      redirect_to course_path(current_course), alert: 'Error Message Here' 
  end
  end

  private

  def require_authorized_for_current_user
    if current_lesson.user != current_lesson
      render plain: "Unauthorized", status: :unauthorized
    end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

   def lesson_params
    params.require(:lesson).permit(:title, :subtitle, :video)
  end
end
