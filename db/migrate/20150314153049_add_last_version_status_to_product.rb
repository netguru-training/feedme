class AddLastVersionStatusToProduct < ActiveRecord::Migration
  def change
    add_column :products, :last_version, :boolean, default: false
  end
end
