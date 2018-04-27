class Carpart < ActiveRecord::Base

  serialize :details, Array
  belongs_to :company
  belongs_to :car
  belongs_to :user

  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos

  validates :name, :presence => true

end
