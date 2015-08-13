class CommentDecorator < ApplicationDecorator

  decorates_association :user
  decorates_association :post

end
