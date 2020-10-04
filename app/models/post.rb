class Post < ApplicationRecord
  has_many :comments
  validates :title, :body, :category, presence: true
end
