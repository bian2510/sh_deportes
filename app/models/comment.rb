class Comment < ApplicationRecord
  belongs_to :post
  validates :name, :last_name, :body, presence: true
end
