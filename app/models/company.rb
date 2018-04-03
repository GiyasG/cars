class Company < ActiveRecord::Base
  belongs_to :user

  validates_format_of :email,:with => Devise::email_regexp
end
