class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :duration, presence: true, :numericality => { :greater_than_or_equal_to => 0 }
  validate :divisible_by_five
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000}
  validates :price, presence: true
  validates_inclusion_of :price, :in => 1..1000
  validates :location, presence: true

  def divisible_by_five
    if (self.duration % 5) != 0
      self.errors[:base] << "Number must be divisible by 5!"
    end
  end

end
