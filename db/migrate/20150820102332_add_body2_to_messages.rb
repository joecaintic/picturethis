class AddBody2ToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :body2, :string
  end
end
