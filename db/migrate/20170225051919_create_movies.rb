class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.datetime :release_date
      t.string :imdb_url
      t.timestamps null: false
    end
  end
end
