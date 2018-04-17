class Car < ActiveRecord::Base
  belongs_to :company
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos

end
