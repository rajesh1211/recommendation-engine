class CreateMovieGenres < ActiveRecord::Migration
  def change
    create_table :movie_genres do |t|
      t.references :movie
      t.references :genre
      t.timestamps null: false
    end
  end
end
