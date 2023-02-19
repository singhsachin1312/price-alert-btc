class Alert < ApplicationRecord
  enum status: [:created, :triggered, :deleted]
  belongs_to :user

   scope :created_alerts, -> { where(status: 'created') }

  def as_json(*)
    super(include: [:user]).except("user_id").tap do |hash|
    end
  end 
end
