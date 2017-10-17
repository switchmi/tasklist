class List < ApplicationRecord
  validates :name, presence: { message: 'Title cannot be blank'}
  has_many :tasks, dependent: :destroy
end
