class Event < ApplicationRecord
  validates :start_date, presence: true
  validate :start_date_cannot_be_in_the_past
  validates :duration, presence: true, numericality: { greater_than: 0, multiple_of: 5 }
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 1000 }
  validates :location, presence: true

  belongs_to :admin, class_name: "User", foreign_key: "user_id"
  
  has_many :attendance

  private

  def start_date_cannot_be_in_the_past
    if start_date < DateTime.now
      errors.add(:start_date, "ne peut pas être dans le passé")
    end
  end
end
