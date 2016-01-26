class Round < ActiveRecord::Base
  has_many :forms, dependent: :delete_all
  validates :member_number, numericality: {allow_blank: false, less_than_or_equal_to: 10}
end
  round = Round.new
  round.valid? # => false
  round.errors[:member_number]


