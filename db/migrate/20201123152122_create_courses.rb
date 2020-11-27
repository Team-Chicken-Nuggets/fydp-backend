class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :identifier, null: false
      t.string :term
      t.string :name, null: false 
      t.text :description, null: false
      t.references :professor, null: false, foreign_key: {to_table: :users}
      t.boolean :archived, null: false, default: false
      t.date :start_date, null: false
      t.timestamps
    end

    create_table :enrollments do |t|
      t.belongs_to :course 
      t.belongs_to :user
      t.timestamps
    end
  end
end
