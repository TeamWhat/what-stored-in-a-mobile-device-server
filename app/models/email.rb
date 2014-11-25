class Email < ActiveRecord::Base
  extend Csvable

  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def self.create_or_increment_count(address)
    email = Email.find_by email: address
    if email.nil?
      email = Email.new(email: address, entries: 0)
    end
    email.entries += 1
    email.save
  end
end
