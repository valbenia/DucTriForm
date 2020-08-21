class AddTokenToFormals < ActiveRecord::Migration[5.1]
  def change
    add_column :formals, :token, :string
  end
end
