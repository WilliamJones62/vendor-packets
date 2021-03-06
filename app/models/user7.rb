class User7 < ApplicationRecord
  self.table_name = "users"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable
  has_many :packets
  enum role: [:normal, :admin]
end
