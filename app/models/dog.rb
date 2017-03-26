class Dog < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def self.search(location, breed, title_age, gender) 
    return all unless location.present? || breed.present? || title_age.present? || gender.present?
    where('location @@ ? AND breed @@ ? AND title_age @@ ? AND gender @@ ?', location, breed.downcase, title_age, gender.downcase)
  end

  validates :name, presence: true
  validates :age, presence: true
  validates :title_age, presence: true
  validates :breed, presence: true
  validates :gender, presence: true
  validates :adoptable, presence: true
  validates :size, presence: true

end
