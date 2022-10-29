class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show edit update destroy ]

  def index
    @reports = Report.order(created_at: :desc).page(params[:page])
  end

  def show
    @comments = @report.comments.order(created_at: :desc)
  end

  def new
    @report = Report.new
  end

  def edit; end

  def create
    user = User.find(params[:user_id])
    @report = user.reports.create(report_params)
    redirect_to reports_path, notice: t('controllers.common.notice_create', name: Report.model_name.human)
  end

  def update
    @report.update(report_params)
    redirect_to reports_path, notice: t('controllers.common.notice_update', name: Report.model_name.human)
  end

  def destroy
    @report.destroy
    redirect_to reports_path, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:title, :content)
    end
end
