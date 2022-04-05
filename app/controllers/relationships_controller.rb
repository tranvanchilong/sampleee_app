class RelationshipsController < ApplicationController
    before_action :logged_in_user
    skip_before_action:verify_authenticity_token
    
    def following
            @title= "Following"
            @user = User.find(params[:id])
            @users= @user.following.paginate(page: params[:page])
            render 'show_follow'
            end
                    
    def create
        other_user = User.find(params[:followed_id])
        @rel= Relationship.new(follower_id: current_user.id,
                                followed_id: other_user.id)
                                @rel.save
                                redirect_to user_path(other_user)
    end
 def destroy
     @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
    format.html { redirect_to @user }
            format.js
    end
    end
end