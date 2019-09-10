class CreateReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :beer, foreign_key: true
    end
  end
end
