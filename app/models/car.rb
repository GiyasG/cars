class Car < ActiveRecord::Base
  belongs_to :company
  has_many :photos

  accepts_nested_attributes_for :photos

end
