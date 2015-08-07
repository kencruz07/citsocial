class Attachment < ActiveRecord::Base
  belongs_to :image, :polymorphic => true
end
