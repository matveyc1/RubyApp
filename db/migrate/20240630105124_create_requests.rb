class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.text :name
      t.text :second_name
      t.text :surname
      t.text :number
      t.text :email
      t.integer :weight
      t.integer :length
      t.integer :width
      t.integer :height
      t.text :start_point
      t.text :finish_point
      t.text :distance
      t.integer :price

      t.timestamps
    end
  end
end
