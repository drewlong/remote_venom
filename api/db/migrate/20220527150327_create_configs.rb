class CreateConfigs < ActiveRecord::Migration[7.0]
  def change
    create_table :configs do |t|
      t.string :payload
      t.string :options
      t.boolean :need_lhost
      t.boolean :need_lport
      t.string :name

      t.timestamps
    end
  end
end
