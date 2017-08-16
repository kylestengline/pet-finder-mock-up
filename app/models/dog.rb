require 'gravtastic'
class Dog < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Gravtastic

  validate :sanitize_dog_name
  validate :sanitize_breed
  validate :sanitize_birth_date
  validate :sanitize_color
  validate :sanitize_photo

  def filters
    bad_filter = LanguageFilter::Filter.new matchlist: :profanity
    sex_filter = LanguageFilter::Filter.new matchlist: :sex
  end
  
  def sanitize_dog_name
    errors.add(:name, ": This kind of language is inappropriate.") if filters.match?(name)
  end

  def sanitize_breed
    errors.add(:breed, ": This kind of language is inappropriate.") if filters.match?(breed)
  end

  def sanitize_color
    errors.add(:color, ": This kind of language is inappropriate.") if filters.match?(color)
  end

  def sanitize_birth_date
    errors.add(:birth_date, ": This kind of language is inappropriate.") if filters.match?(birth_date)
  end

  def sanitize_photo
    errors.add(:photo, ": This kind of language is inappropriate.") if filters.match?(photo)
  end

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

  belongs_to :admin
end
