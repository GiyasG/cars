class Company < ActiveRecord::Base

  belongs_to :user
  has_many :logos, dependent: :destroy
  has_many :cars, dependent: :destroy
  has_many :carparts, through: :car

  accepts_nested_attributes_for :logos

  validates_format_of :email, :with => Devise::email_regexp


end
