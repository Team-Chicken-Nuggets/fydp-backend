class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.string :identifier
      t.belongs_to :user 
      t.belongs_to :lecture
      t.string :time
      t.timestamps
    end
  end
end
