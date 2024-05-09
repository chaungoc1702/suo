module Admin
  class LessonsController < ApplicationController
    before_action :set_lesson, only: [:show, :edit, :update, :destroy]

    # GET /lessons
    def index
      @lessons = Lesson.all.includes(:level)
    end
  
    # GET /lessons/1
    def show
    end
  
    # GET /lessons/new
    def new
      @lesson = Lesson.new
      fetch_form_associations
    end
  
    # GET /lessons/1/edit
    def edit
      fetch_form_associations
    end
  
    # POST /lessons
    def create
      @lesson = Lesson.new(lesson_params)
  
      if @lesson.save!
        redirect_to admin_lessons_path, notice: 'Lesson was successfully created.'
      else
        fetch_form_associations
        render :new
      end
    end
  
    # PATCH/PUT /lessons/1
    def update
      if @lesson.update(lesson_params)
        redirect_to admin_lessons_path, notice: 'Lesson was successfully updated.'
      else
        fetch_form_associations
        render :edit
      end
    end
  
    # DELETE /lessons/1
    def destroy
      @lesson.destroy
      redirect_to admin_lessons_path, notice: 'Lesson was successfully destroyed.'
    end
  
    private

    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:name, :code, :level_id, :title, :description, :image_filename)
    end

    def fetch_form_associations
      @levels = Level.all.to_a
    end
  end
end
