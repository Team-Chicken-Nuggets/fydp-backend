class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :video_link
      t.belongs_to :course
      t.belongs_to :user
      t.date :visible_on, null: false
      t.timestamps
    end
  end
end
