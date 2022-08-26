class Article < ApplicationRecord
  has_many :comments , dependent: :destroy
  has_one_attached :avatar
  belongs_to :user
  validates :title,presence: true;
  validates :description,presence: true;
  validates :avatar,presence: true;
  # ddd

end

