class AddColumnsToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :lat, :decimal, {:precision=>10, :scale=>6}
    add_column :visits, :lng, :decimal, {:precision=>10, :scale=>6}
  end
end
