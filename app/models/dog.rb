require 'gravtastic'
class Dog < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Gravtastic
  gravtastic :secure => true,
             :filetype => :jpg,
             :size => 250

  scope :location, -> (location) { where location: location }
  scope :breed, -> (breed) { where breed: breed }
  scope :title_age, -> (title_age) { where title_age: title_age }
  scope :gender, -> (gender) { where gender: gender }

  validates :name, presence: true
  validates :age, presence: true
  validates :title_age, presence: true
  validates :breed, presence: true
  validates :gender, presence: true
  validates :adoptable, presence: true
  validates :size, presence: true

#  belongs_to :admin
end
