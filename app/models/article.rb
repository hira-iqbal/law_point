class Article < ApplicationRecord
  belongs_to :user
  belongs_to :article_type

  has_many :photos, as: :imageables
  has_many_attached :photos

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 200 }

  scope :ordered, -> { order(updated_at: :desc) }
end
