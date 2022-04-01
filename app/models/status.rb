class Status < ApplicationRecord
  belongs_to :user

  has_many :status_comments, dependent: :destroy
  accepts_nested_attributes_for :status_comments, allow_destroy: :true

  default_scope -> {order(created_at: :desc)}

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 2000}
end
