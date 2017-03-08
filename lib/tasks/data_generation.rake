namespace :data_generation do
  desc "TODO"
  task final_data: :environment do
    
      
      MovieRating.all.order(:movie_id).group_by(&:movie_id).each do |movie_id, movie_ratings|
        File.open("data/individual-data/movie#{movie_id}.txt", "w") do |f| 
          movie_ratings.each do |movie_rating| 
            f.write(movie_rating.movie_id.to_s + ",") 
            f.write(movie_rating.user.id.to_s + ",") 
            f.write(movie_rating.user.age.to_s + ",") 
            f.write(movie_rating.user.occupation.id.to_s + ",") 
            if movie_rating.rating >= 2.5
              f.write("1") 
            else
              f.write("0") 
            end 
            f.write "\n"
          end  
        end
      end  
  end

end
