class Post < ActiveRecord::Base
  validates :image, presence: true
  has_attached_file :image, styles: { :thumb => "440x", :medium => "580x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
