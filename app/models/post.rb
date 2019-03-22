class Post < ApplicationRecord
    validates :author, presence: true, length: {maximum: 50}
    validates :title, presence: true, length: {maximum: 50}
    validates :post, presence: true, length: {maximum: 2000}

    has_many   :comments, dependent: :destroy
    belongs_to :user, optional: true

    acts_as_votable
end
