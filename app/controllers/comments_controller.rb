class CommentsController < ApplicationController
    def index
        @comments = Comment.where(post_id: params[:id])
    end
end
