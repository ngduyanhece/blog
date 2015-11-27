class Post < ActiveRecord::Base
	validates :title, presence: true 
	validates :content, presence: true 
	belongs_to :user 
	scope :current, -> {where("created_at >= ?", "#{Time.now}")}
  def to_s 
    title
  end
end
