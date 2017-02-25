# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



require 'csv'

ActiveRecord::Base.transaction do
  CSV.foreach(Rails.root.join('data','occupation'), { :col_sep => '|' }) do | obj |  
    Occupation.create(name: obj[0])
  end

  CSV.foreach(Rails.root.join('data','genre'), { :col_sep => '|' }) do | obj |  
    Genre.create(name: obj[0])
  end

  CSV.foreach(Rails.root.join('data','user'), { :col_sep => '|' }) do | obj |  
    user = User.new
    user.age = obj[1]
    user.gender = obj[2]
    user.occupation_id = Occupation.find_by_name(obj[3]).id
    user.save
  end

  CSV.foreach(Rails.root.join('data','item'), { :col_sep => '|' , :encoding => 'ISO-8859-1'}) do | obj |  
    movie = Movie.new
    movie.title = obj[1]
    movie.release_date = obj[2]
    movie.imdb_url = obj[4]
    movie.save

    for i in 5..23
      if obj[i] == "1"
        movie_genre = MovieGenre.new
        movie_genre.movie_id = movie.id
        movie_genre.genre_id = Genre.find(i-4).id
        movie_genre.save
      end  
    end  
  end

  CSV.foreach(Rails.root.join('data','data'), { :col_sep => ' ' }) do | obj |  
    movie_rating = MovieRating.new
    movie_rating.user_id = obj[0]
    movie_rating.movie_id = obj[1]
    movie_rating.rating = obj[2]
    movie_rating.rated_at = DateTime.strptime(obj[3],'%s') if obj[3] != ""
    movie_rating.save
  end  
end