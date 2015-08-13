class PostDecorator < ApplicationDecorator

  decorates_association :user
  decorates_association :comment



  def likers
    like_number = self.likes.count
    "#{like_number} #{'like'.pluralize like_number}"
  end

  def commenters
    comment_number = self.comments.count
    "#{comment_number} #{'comment'.pluralize comment_number}"
  end

end
