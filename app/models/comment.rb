class Comment < ApplicationRecord
  belongs_to :case

  # validates :commenter, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
