class Student < ApplicationRecord
  validates_presence_of :name, :roll_number, :branch, :address, :admission_year, :cgpa, message: 'cannot be null',
                                                                                        on: :create
  def cgpa=(value)
    raise ArgumentError if value > 10 || value.negative?

    super(value)
  end
end
