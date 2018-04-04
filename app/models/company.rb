class Company < ActiveRecord::Base

  belongs_to :user
  has_many :logos

  accepts_nested_attributes_for :logos

  validates_format_of :email, :with => Devise::email_regexp


end
