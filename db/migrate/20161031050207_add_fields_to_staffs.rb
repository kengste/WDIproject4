class AddFieldsToStaffs < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :first_name, :string
    add_column :staffs, :last_name, :string
  end
end
