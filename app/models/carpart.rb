class Carpart < ActiveRecord::Base
  # before_save :check_it
  serialize :details, OpenStruct
  belongs_to :company
  belongs_to :car
  belongs_to :user

  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos

  validates :name, :presence => true

  # def check_it
  #   self.detail = self.detail.to_hash
  #   binding.pry
  # end

  # def details=(val)
  #   return super if val.is_a? OpenStruct
  #   super OpenStruct.new val.to_h if val
  # end

end
