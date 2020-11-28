class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.belongs_to :lecture
      t.belongs_to :user
      t.timestamps
    end
  end
end
