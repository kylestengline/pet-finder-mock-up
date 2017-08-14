require 'gravtastic'
class Dog < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include Gravtastic

  validate :sanitize_dog_profanity
  validate :sanitize_breed_profanity
  validate :dirty_dog_name
  validate :dirty_breed_name
  
  def sanitize_dog_profanity
    bad_filter = LanguageFilter::Filter.new matchlist: :profanity
    if bad_filter.match?(name)
      errors.add(:name, "This kind of language is inappropriate for a dog name.")
    end
  end

  def sanitize_breed_profanity
    bad_filter = LanguageFilter::Filter.new matchlist: :profanity
    if bad_filter.match?(breed)
      errors.add(:breed, "This kind of language is inappropriate for a breed name.")
    end
  end

  def dirty_dog_name
    sex_filter = LanguageFilter::Filter.new matchlist: :sex
    if sex_filter.match?(name)
      errors.add(:name, "This kind of language is inappropriate for a dog name.")
    end
  end

  def dirty_breed_name
    sex_filter = LanguageFilter::Filter.new matchlist: :sex
    if sex_filter.match?(breed)
      errors.add(:breed, "This kind of language is inappropriate for a breed name.")
    end
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
