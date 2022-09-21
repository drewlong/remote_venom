class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.string :payload
      t.string :lhost
      t.string :lport
      t.string :dst_ip
      t.string :blob

      t.timestamps
    end
  end
end
