class User < ApplicationRecord
  belongs_to :group
  has_many :answers
  has_many :questions, through: :answers

  accepts_nested_attributes_for :answers
end
