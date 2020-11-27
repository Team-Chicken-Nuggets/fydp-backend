class AddMoreFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :identifier, :string
    add_column :users, :role, :string
  end
end
