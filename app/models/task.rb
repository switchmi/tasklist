class Task < ApplicationRecord
  validates :title, presence: {message: 'Title cannot be blank!'}
  belongs_to :list
  has_attached_file :task_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :task_image, :content_type => /\Aimage\/.*\Z/
end
