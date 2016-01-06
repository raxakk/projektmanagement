class Wb < ActiveRecord::Base
  belongs_to :worker
  belongs_to :rb
  has_many :Wbs, foreign_key: :parent_id, :dependent => :delete_all
  belongs_to :Wb, foreign_key: :parent_id
end
