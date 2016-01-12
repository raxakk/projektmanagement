class Form < ActiveRecord::Base
  belongs_to :round
  belongs_to :worker
  validates :pes, numericality: {allow_blank: true}
  validates :opt, numericality: {allow_blank: true}
  validates :real, numericality: {allow_blank: true}
end
