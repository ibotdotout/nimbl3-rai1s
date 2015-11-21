class UploadController < ApplicationController
  acts_as_token_authentication_handler_for User
  require 'csv'

  def index
    respond_to do |format|
      @jobs = Job.where(:user_id => current_user.id)
      format.html
      format.json {
        render :json => {:data => @jobs}
      }
    end
  end

  def new
    respond_to do |format|
      format.html
    end
  end

  def create
    file_data = params[:file].read
    csv_rows  = CSV.parse(file_data)
    rowarray = csv_rows.map { |row| row.join() }
    @job= Job.new(length: rowarray.length, data:
                  rowarray.join(", "), user_id:
                  current_user.id)
    @job.save
    @report = Report.new()
    @report.query(@job, rowarray[0], 0)
    @data = rowarray.join(", ")
    respond_to do |format|
      format.html
      format.json{
        render :json => @job
      }
    end
  end
end
