class CommentsController < ApplicationController
  before_action :set_post

  def create
    comment = @post.comments.create! params.require(:comment).permit(:content)
    # CommentsMailer.submitted(comment).deliver_later

    comment.broadcast_append_to :comments, target: :comments
    comments_count = @post.comments.count
    @post.broadcast_replace_to(
      :posts,
      target: "post_#{@post.id}_comments_count",
      locals: { comments_count:, post_id: @post.id },
      partial: 'posts/comments_count'
    )
    @post.broadcast_replace_to(
      :post,
      target: "post_#{@post.id}_comments_count",
      locals: { comments_count:, post_id: @post.id },
      partial: 'posts/comments_count'
    )
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
