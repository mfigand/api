# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  default_scope -> { where(deleted_at: nil) }

  belongs_to :role
  before_validation :assign_role

  validates :name, :lastname, length: { maximum: 250 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
                       format: { with: /\A[a-zA-ZÑñ0-9\ ]+\z/ },
                       length: { minimum: 8 },
                       if: :password
  # validates_each :password do |record, attr, value|
  #   record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  #   end
  # /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])\w{8,}$/

  def soft_delete
    update(deleted_at: Time.now.utc)
  end

  private

  def assign_role
    self.role ||= Role.find_or_create_by(name: 'default')
  end
end
