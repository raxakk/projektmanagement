class Pb < ActiveRecord::Base
  has_many :Pbs, foreign_key: :parent_id, :dependent => :delete_all
  belongs_to :Pb, foreign_key: :parent_id
end
