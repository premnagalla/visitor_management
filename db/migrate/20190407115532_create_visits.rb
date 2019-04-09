class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :tenant_id
      t.string :first_name
      t.string :last_name
      t.integer :visitor_id
      t.string :email
      t.string :contact_no
      t.integer :no_of_guests
      t.string :govt_id_type
      t.string :govt_id
      t.datetime :visit_time
      t.boolean :allow_more_or_less

      t.timestamps
    end
  end
end
