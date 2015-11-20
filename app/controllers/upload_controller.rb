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
    rowarray = Array.new

    file_data = params[:file].read
    csv_rows  = CSV.parse(file_data)
    csv_rows.each do |row|
      rowarray << row
      @rowarraydisp = rowarray
    end
    respond_to do |format|
      format.html
      format.json {
        render :json => {:data => @rowarraydisp}
      }
    end
  end
end
