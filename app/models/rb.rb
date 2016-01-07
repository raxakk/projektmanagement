class Rb < ActiveRecord::Base
  has_many :wb

  has_many :Rbs, foreign_key: :parent_id, :dependent => :delete_all
  belongs_to :Rb, foreign_key: :parent_id
end
