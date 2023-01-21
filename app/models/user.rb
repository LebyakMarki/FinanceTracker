class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  # has_many :spending


  has_many :spending,
           foreign_key: :user_id
  has_many :share
  has_many :table_shared_with_me,
           through: :share,
           source: :spending
end
