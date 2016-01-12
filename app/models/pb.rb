class Pb < ActiveRecord::Base
  has_many :Pbs, foreign_key: :parent_id, :dependent => :destroy
  belongs_to :Pb, foreign_key: :parent_id
end
