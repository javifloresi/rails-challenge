class Employee < ActiveRecord::Base
  validates :first_name, presence: true, length: { maximum: 256 }
  validates :last_name, presence: true, length: { maximum: 256 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :date_of_birth, presence: true
  validate :date_of_birth_cannot_be_in_the_future
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  private

  # Custom validation method to ensure date_of_birth is not in the future
  def date_of_birth_cannot_be_in_the_future
    if date_of_birth.present? && date_of_birth > Date.today
      errors.add(:date_of_birth, "can't be in the future")
    end
  end
end
  