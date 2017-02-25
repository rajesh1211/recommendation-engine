class CreateMovieRatings < ActiveRecord::Migration
  def change
    create_table :movie_ratings do |t|
      t.references :user
      t.references :movie
      t.integer :rating
      t.datetime :rated_at
      t.timestamps null: false
    end
  end
end
