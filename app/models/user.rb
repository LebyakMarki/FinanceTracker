class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spending,
           foreign_key: :user_id
  has_many :shares
  has_many :tables_shared_with_me,
           through: :shares,
           source: :spending
end
