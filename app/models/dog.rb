class Dog < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def self.search(location, breed, age, gender) 
    return all unless location.present? || breed.present? || age.present? || gender.present?
    where(['location LIKE ? AND breed LIKE ? AND age LIKE ? AND gender LIKE ?', "%#{location}%", "%#{breed.downcase}%", "%#{age}%", "%#{gender.downcase}%"])
  end

  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :gender, presence: true
  validates :adoptable, presence: true
  validates :size, presence: true

end
