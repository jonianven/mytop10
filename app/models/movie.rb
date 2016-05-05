class Movie < ActiveRecord::Base
  validates :title, :year, :director, :cast, :description, :rank, :review, presence: true

  YEARS = (1900..2020)
  RANKS = (1..10)

end
