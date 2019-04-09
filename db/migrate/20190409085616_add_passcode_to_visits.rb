class AddPasscodeToVisits < ActiveRecord::Migration[5.2]
  def change
    add_column :visits, :passcode, :integer
  end
end
