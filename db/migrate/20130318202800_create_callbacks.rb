class CreateCallbacks < ActiveRecord::Migration
  def change
    create_table :callbacks do |t|
      t.string     :continuous_integration
      t.text       :token
      t.references :karotz_rabbit

      t.timestamps
    end
  end
end
