class UserDecorator < ApplicationDecorator

  decorates_association :post
  decorates_association :comment



  def to_s
    "#{self.first_name} #{self.last_name}"
  end

end
