class Post < ApplicationRecord
  has_one_attached :cover
  has_many :comments
  validates :title, :body, :category, :cover, presence: true
end
