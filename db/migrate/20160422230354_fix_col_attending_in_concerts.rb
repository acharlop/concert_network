class FixColAttendingInConcerts < ActiveRecord::Migration
  def change
  	rename_column :concerts, :attending, :tickets
  end
end
