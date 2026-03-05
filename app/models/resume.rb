class Resume < ApplicationRecord
  belongs_to :chat
  has_one :user, through: :chat

  validates :description, presence: true
end
