class CreateAlerts < ActiveRecord::Migration[7.0]
  def change
    create_table :alerts do |t|
      t.string :price
      t.references :user
      t.integer :status, default: 0
      
      t.timestamps
    end
  end
end
