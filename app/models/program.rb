class Program < ApplicationRecord
  has_many :chats, dependent: :destroy
end
