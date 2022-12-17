class Article < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 200 }

  scope :ordered, -> { order(updated_at: :desc) }
end
