class User < ActiveRecord::Base
  has_secure_password
  has_many :tools
  has_many :categories, through: :tools

  enum role: %w(default admin)
end
