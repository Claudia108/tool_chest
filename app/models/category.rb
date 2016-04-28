class Category < ActiveRecord::Base
has_many :tools
# belongs_to :user, through: :tools
end
