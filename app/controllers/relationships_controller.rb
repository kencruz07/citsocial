class RelationshipsController < ApplicationController
  def create
    user = User.find params[:followed_id]
    current_user.follow user.id
    redirect_to :back
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow user.id
    redirect_to :back
  end
end
