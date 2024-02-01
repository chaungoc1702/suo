module Learn
  # Common functionality for grammar, vocabulary,
  # practice, and test.
  class LessonItemController < ApplicationController
    before_action :fetch_level,
                  :fetch_lesson

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
