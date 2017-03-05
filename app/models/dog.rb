class Dog < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :name, presence: true
  validates :age, presence: true
  validates :breed, presence: true
  validates :gender, presence: true
  validates :adoptable, presence: true
  validates :size, presence: true

end
