class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :all_except, -> (user){where.not(id:user)}
  #broadcast if another user join
  after_create_commit{ broadcast_append_to "users" }
  has_many :messages
end
