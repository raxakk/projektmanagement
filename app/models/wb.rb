class Wb < ActiveRecord::Base
  belongs_to :worker
  belongs_to :rb
  has_many :Wbs, foreign_key: :parent_id, :dependent => :delete_all
  belongs_to :Wb, foreign_key: :parent_id

  def <=> other
    return 0 if !parent_id && !other.parent_id
    return -1 if !parent_id
    return 1 if !other.parent_id
    self.parent_id <=> other.parent_id
  end

end
