class Admin::CoursesController < AdminController 
  def index
    @admin_courses = Course.all
  end

  def show
    @admin_course = Course.find(params[:id])
  end

  def new
    @admin_course = Course.new
  end

  def create
    @admin_course = Course.new(course_params)

    if @admin_course.save
      redirect_to admin_courses_path
    else
      render :new
    end
  end

  def edit
    @admin_course = Course.find(params[:id])
  end

  def update
    @admin_course = Course.find(params[:id])

    if @admin_course.update(course_params)
      redirect_to admin_courses_path
    else
      render :edit
    end
  end


  private

  def course_params
    params.require(:course).permit(:title, :description, :premium_description, :paid, :stripe_price_id, :image)
  end
end
