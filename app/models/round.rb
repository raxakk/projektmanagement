class Round < ActiveRecord::Base
  has_many :forms, dependent: :delete_all
end
