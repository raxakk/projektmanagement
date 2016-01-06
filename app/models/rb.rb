class Rb < ActiveRecord::Base
  has_many :wb

  has_many :Rbs, foreign_key: :parent_id, :dependent => :delete_all
  belongs_to :Rb, foreign_key: :parent_id

  def <=> other
    return 0 if !parent_id && !other.parent_id
    return -1 if !parent_id
    return 1 if !other.parent_id
    self.parent_id <=> other.parent_id
  end
end
