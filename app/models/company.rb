class Company < ActiveRecord::Base

  belongs_to :user
  has_many :logos
  has_many :cars

  accepts_nested_attributes_for :logos

  validates_format_of :email, :with => Devise::email_regexp


end
