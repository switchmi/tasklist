class Task < ApplicationRecord
  validates :title, presence: {message: 'Title cannot be blank!'}
  belongs_to :list
  has_attached_file :task_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :task_image, :content_type => /\Aimage\/.*\Z/
  attr_reader :image_remote_url

  def image_remote_url=(url_value)
    self.task_image = URI.parse(url_value)
    @image_remote_url = url_value
  end
end
