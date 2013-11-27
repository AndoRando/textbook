class Lesson < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, :use => [:slugged, :finders]

  acts_as_paranoid

  default_scope -> {order :number}

  attr_accessible :name, :content, :section_id, :number, :public, :deleted_at, :video_id

  validates :name, :presence => true, :uniqueness => true
  validates :content, :presence => true
  validates :number, :presence => true, :numericality => {:only_integer => true}
  validates :section, :presence => true

  belongs_to :section

  before_destroy :set_private

  def next
    Lesson.where('number > ?', number).first
  end

  def previous
    Lesson.where('number < ?', number).last
  end

  def next_lesson?
    self.next != nil
  end

  def previous_lesson?
    self.previous != nil
  end

  def has_video?
    !video_id.blank?
  end

  private

  def set_private
    update_attributes(:public => false)
  end
end
