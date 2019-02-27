class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :employee, :dependent => :destroy
  accepts_nested_attributes_for :employee, allow_destroy: true
end
