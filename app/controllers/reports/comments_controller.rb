# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  def create
    @report = Report.find(params[:report_id])
    @comment = @report.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to report_path(@report), notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      @comments = @report.comments.order(created_at: :desc)
      render 'reports/show'
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
