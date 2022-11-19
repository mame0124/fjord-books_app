# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def edit; end

  def update
    if @comment.user == current_user
      @comment.update(comment_params)
      redirect_to @comment.commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      redirect_to @comment.commentable, notice: t('controllers.common.could_not_update')
    end
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      redirect_to @comment.commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
    else
      redirect_to @comment.commentable, notice: t('controllers.common.could_not_destroy')
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
