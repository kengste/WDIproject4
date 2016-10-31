class AddRefToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :staffs, :user, foreign_key: true
  end
end
