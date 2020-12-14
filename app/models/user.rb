# User model
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :lockable, :timeoutable

  validates :first_name, :last_name, presence: true
  validates :email, format: { with: Rails.application.config.email_regex }

  scope :ordered, -> { order('users.last_name ASC') }

  # Server side searching of users
  def self.search(query)
    query.strip!
    t          = arel_table
    conditions = t[:email].matches("%#{query}%")
    conditions = conditions.or(t[:last_name].matches("%#{query}%")).or(t[:first_name].matches("%#{query}%"))
    where(conditions)
  end

  # Get our full name: John Q Doe
  def full_name
    [first_name, last_name].compact.join(' ')
  end

  # Get our legal name: Doe, John Q
  def legal_name
    [last_name, first_name].compact.join(', ')
  end

  # Spit out this user to a String representation
  def to_s
    full_name
  end
end
