class AddPaperclipToPostAndComment < ActiveRecord::Migration
  def change
    add_attachment :posts, :attachment
    add_attachment :comments, :attachment
  end
end
