class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.text :description
      t.string :category
      t.references :soul, index: true
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.timestamps
    end
  end

  #def self.up
  #  add_column :attachments, :attachment_file_name, :string
  #  add_column :attachments, :attachment_content_type, :string
  #  add_column :attachments, :attachment_file_size, :integer
  #end
  #def self.down
  #  remove_column :attachments, :attachment_file_name
  #  remove_column :attachments, :attachment_content_type
  #  remove_column :attachments, :attachment_file_size
  #end
end
