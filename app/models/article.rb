class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 50 }
  validates :text, presence: true, length:{ minimum: 10, maximum: 2000 }
  validates :user_id, presence: true
end
