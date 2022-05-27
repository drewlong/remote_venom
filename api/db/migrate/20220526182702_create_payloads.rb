class CreatePayloads < ActiveRecord::Migration[7.0]
  def change
    create_table :payloads do |t|
      t.string :name
      t.string :description
      t.string :path
      t.string :platform
      t.timestamps
    end
  end
end
