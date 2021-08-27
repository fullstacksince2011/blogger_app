# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_post, only: %i[new create edit update destroy]

  # GET /posts/post_id/comments/new
  def new
    @comment = @post.comments.new(parent_id: params[:parent_id])
  end

  # GET /posts/post_id/comments/1/edit
  def edit; end

  # POST /posts/post_id/comments
  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      # Comment broadcast data
      comment_data = {
        id: @comment.id,
        post_id: @comment.post_id,
        body: @comment.body,
        time: @comment.created_at.to_formatted_s(:short),
        email: @comment.user.email,
        total_comments: Post.find(@comment.post_id).comments.count,
        parent_id: @comment.parent_id
      }
      ActionCable.server.broadcast('comment_channel', { comment: comment_data })
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.permit(:post_id, :user_id, :body, :parent_id)
  end
end
