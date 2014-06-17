class CreateSoulJournals < ActiveRecord::Migration
  def change
    create_table :soul_journals do |t|
      t.references :soul, index: true
      t.text :body

      t.timestamps
    end
  end
end
