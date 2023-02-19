class User < ApplicationRecord
  require 'securerandom'

  has_secure_password

  has_many :alerts, dependent: :destroy
  validates :email, presence: true

  def as_json(*)
    super(include: [:alerts]).tap do |hash|
    end
  end 

end
