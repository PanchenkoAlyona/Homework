class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :title
      t.string :text
      t.integer :user_id
      #t.referances :user, index:true
      
      t.timestamps null: false
    end
  end
end
