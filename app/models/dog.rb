class Dog < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def self.search(location, breed, age, gender) 
    age = age.to_s
    return all unless location.present? || breed.present? || age.present? || gender.present?
    where('location @@ ? AND breed @@ ? AND age = ? AND gender @@ ?', location, breed.downcase, age, gender.downcase)
  end

  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :gender, presence: true
  validates :adoptable, presence: true
  validates :size, presence: true

end
