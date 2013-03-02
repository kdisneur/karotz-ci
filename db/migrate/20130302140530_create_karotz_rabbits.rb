class CreateKarotzRabbits < ActiveRecord::Migration
  def change
    create_table :karotz_rabbits do |t|
      t.string     :name
      t.string     :install_id
      t.string     :continuous_integration
      t.text       :token
      t.references :user

      t.timestamps
    end
  end
end
