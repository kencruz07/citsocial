class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name
      t.references :image, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
