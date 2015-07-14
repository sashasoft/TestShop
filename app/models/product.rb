class Product < ActiveRecord::Base
  before_save { name.downcase! }
  validates :name, presence: true, length: { in: 3..30 }, uniqueness: { case_sensitive: false }
end
