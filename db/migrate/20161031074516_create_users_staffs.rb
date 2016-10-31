class CreateUsersStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :users_staffs do |t|
      t.references :user, foreign_key: true
      t.references :staff, foreign_key: true

      t.timestamps
    end
  end
end
