class Task < ApplicationRecord
  validates :title, presence: {message: 'Title cannot be blank!'}
  belongs_to :list
end
