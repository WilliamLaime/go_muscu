class Program < ApplicationRecord
  has_many :chats, dependent: :destroy
  has_one_attached :image
end
