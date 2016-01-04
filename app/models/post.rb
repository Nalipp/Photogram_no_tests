class Post < ActiveRecord::Base
  belongs_to :user
  validates :image, presence: true
  has_attached_file :image, styles: { :thumb => "340x", :medium => "480x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
