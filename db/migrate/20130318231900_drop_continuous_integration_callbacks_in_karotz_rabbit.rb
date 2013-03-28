class DropContinuousIntegrationCallbacksInKarotzRabbit < ActiveRecord::Migration
  def up
    remove_column :karotz_rabbits, :continuous_integration
    remove_column :karotz_rabbits, :token
  end

  def down
    add_column :karotz_rabbits, :continuous_integration
    add_column :karotz_rabbits, :token
  end
end
