# frozen_string_literal: true

class Books::CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to book_path(@book), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      @comments = @book.comments.order(created_at: :desc)
      render 'books/show'
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
