class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.references :soul, index: true
      t.text :body
      t.string :cat

      t.timestamps
    end
  end
end
