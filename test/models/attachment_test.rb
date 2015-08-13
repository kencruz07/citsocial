# == Schema Information
#
# Table name: attachments
#
#  id                 :integer          not null, primary key
#  attachable_id      :integer
#  attachable_type    :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
