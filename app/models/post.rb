# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # the like associations
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  has_one_attached :image
  # Validation
  validates :title, :user_id, presence: true
end
