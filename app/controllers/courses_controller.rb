class CoursesController < ApplicationController
  before_action :set_course, only: %i[ show edit update destroy ]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
    @user_unlocked_courses = current_user&.course_users&.pluck(:course_id)
    @user_started_courses = current_user&.lesson_users&.joins(:lesson)&.pluck(:course_id)&.uniq
    if @user_started_courses.present?
      @user_course_progresses = @user_started_courses.map do |course_id|
        course_lessons = Course.find(course_id).lessons.count
        completed_lessons = current_user&.lesson_users&.joins(:lesson)&.where(completed: true, lesson: { course: course_id })&.count
        { course_id: course_id, completed_percentage: (completed_lessons.to_f / course_lessons.to_f * 100).to_i }
      end
    end
  end

  # GET /courses/1 or /courses/1.json
  def show
    @completed_lessons = current_user&.lesson_users&.joins(:lesson)&.where(completed: true, lesson: { course: @course })&.pluck(:lesson_id)
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :description)
    end
end
