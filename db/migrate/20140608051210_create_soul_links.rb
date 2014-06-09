class CreateSoulLinks < ActiveRecord::Migration
  def change
    create_table :soul_links do |t|
      t.references :soul, index: true
      t.references :link, index: true

      t.timestamps
    end
  end
end
