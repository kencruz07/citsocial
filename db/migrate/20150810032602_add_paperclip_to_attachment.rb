class AddPaperclipToAttachment < ActiveRecord::Migration
  def change
    add_attachment :attachments, :image
  end
end
