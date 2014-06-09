class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.text :body
      t.references :soul, index: true
      t.string :url

      t.timestamps
    end
  end
end
