class MovieRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  has_many :self_movie_ratings , class_name: "MovieRating", foreign_key: 'id'
end
