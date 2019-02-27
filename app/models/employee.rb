class Employee < ApplicationRecord
  belongs_to :department
  belongs_to :user
  has_one :compensation
end
