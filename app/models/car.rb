class Car < ActiveRecord::Base
  belongs_to :company
  has_many :photos, dependent: :destroy
  has_many :carparts, dependent: :destroy

  accepts_nested_attributes_for :photos

  validates :make, :presence => true
  validates :model, :presence => true

end
