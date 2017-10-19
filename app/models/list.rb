class List < ApplicationRecord
  validates :name, presence: { message: "Cannot be blank!" }
  has_many :tasks, dependent: :destroy
end
