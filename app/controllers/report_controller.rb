class ReportController < ApplicationController
  acts_as_token_authentication_handler_for User
  def index
    @reports = Report.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @report = Report.find(params[:id])
    respond_to do |format|
      format.html
      format.json{
        render :json => @report
      }
    end
  end
end
