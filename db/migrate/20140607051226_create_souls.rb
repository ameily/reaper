class CreateSouls < ActiveRecord::Migration
  def change
    create_table :souls do |t|
      t.string :name
      t.text :description
      t.integer :reap_count
      t.integer :rot_count
      t.integer :harvest_count
      t.integer :comment_count
      t.string :lang
      t.string :loe

      t.timestamps
    end
  end
end
