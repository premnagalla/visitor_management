class CreateTenantLockers < ActiveRecord::Migration[5.2]
  def change
    create_table :tenant_lockers do |t|
      t.integer :user_id
      t.integer :locker_id
      t.integer :visit_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
