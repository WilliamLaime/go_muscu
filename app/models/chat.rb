class Chat < ApplicationRecord
  belongs_to :program
  belongs_to :user
end
