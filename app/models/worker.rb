class Worker < ActiveRecord::Base
  has_many :wb
  has_many :forms
end
