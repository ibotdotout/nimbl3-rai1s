class UploadController < ApplicationController
  acts_as_token_authentication_handler_for User
  require 'csv'

  def index
    respond_to do |format|
      format.html
      format.json {
        render :json => {:state => {:code => 0}, :data =>  "nothing"}
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
    @rowarraydisp = rowarray
    respond_to do |format|
      format.html
      format.json{
        render :json => {:job_id => 1, :length => @rowarraydisp.length,
                         :data => @rowarraydisp}
      }
    end
  end
end
