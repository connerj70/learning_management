class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show update ]

  # GET /lessons/1 or /lessons/1.json
  def show
    @course = @lesson.course
  end

  def update

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end
end
