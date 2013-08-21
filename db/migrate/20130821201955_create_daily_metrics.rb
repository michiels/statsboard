class CreateDailyMetrics < ActiveRecord::Migration
  def change
    create_table :daily_metrics do |t|
      t.integer :value
      t.belongs_to :metric
      t.date :date

      t.timestamps
    end
  end
end
