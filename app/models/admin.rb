class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validate :sanitize_email

  def filters
    bad_filter = LanguageFilter::Filter.new matchlist: :profanity
    sex_filter = LanguageFilter::Filter.new matchlist: :sex
  end

  def sanitize_email
    errors.add(:email, ": This kind of language is inappropriate.") if filters.match?(email)
  end

  has_many :dogs
end
