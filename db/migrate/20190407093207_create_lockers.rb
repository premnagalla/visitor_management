class CreateLockers < ActiveRecord::Migration[5.2]
  def change
    create_table :lockers do |t|
      t.boolean :status, default: 1

      t.timestamps
    end
  end
end
