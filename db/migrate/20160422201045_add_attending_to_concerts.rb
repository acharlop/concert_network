class AddAttendingToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :attending, :integer
  end
end
