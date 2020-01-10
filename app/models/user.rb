class User < ApplicationRecord
  validates_uniqueness_of :username
  has_many :followers
  has_one_attached :dp
  has_many :posts
  has_many :likes
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
