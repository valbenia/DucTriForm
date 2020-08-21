class CreateFormals < ActiveRecord::Migration[5.1]
  def change
    create_table :formals do |t|
      t.string :name
      t.date :date
      t.string :company
      t.string :content

      t.timestamps
    end
  end
end
