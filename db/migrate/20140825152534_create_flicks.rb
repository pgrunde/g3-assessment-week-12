class CreateFlicks < ActiveRecord::Migration
  def change
    create_table :flicks do |t|
      t.string :name
      t.integer :year
      t.string :synopsis
    end
  end
end
