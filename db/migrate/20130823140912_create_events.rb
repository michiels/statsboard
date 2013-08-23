class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description
      t.date :happened_on

      t.timestamps
    end
  end
end
