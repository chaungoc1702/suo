module Learn
  class LessonsController < ApplicationController
    before_action :fetch_level
    before_action :fetch_lesson, only: :show

    # GET /lessons
    def index
      @lessons = @level.lessons.to_a
    end

    private

    def fetch_level
      @level = Level.where(code: params[:level_slug]&.upcase).first
      raise 'Level not found' unless @level
    end

    def fetch_lesson
      @lesson = @level.lessons.where(code: params[:lesson_slug]&.upcase).first
      raise 'Lesson not found' unless @lesson
    end
  end
end
