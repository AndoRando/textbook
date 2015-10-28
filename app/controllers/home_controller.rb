class HomeController < ApplicationController
  def show
    if Lesson.accessible_by(current_ability).any?
      redirect_to section_lesson_path(Section.first, Section.first.lessons.accessible_by(current_ability).first)
    end
  end
end
