class ComplaintsController < ApplicationController
  before_action :api_params

  def index

  end

  def full_count_by_month
    @complaints = Complaint.full_count_by_date(Complaint::MONTH)
    render json: @complaints
  end

  def full_count_by_day
    @complaints = Complaint.full_count_by_date(Complaint::DAY)
    render json: @complaints
  end

  def count_by_groups
    begin
      @complaints = Complaint.build_group_query(params[:groups])
      @complaints = @complaints.count
      render json: @complaints
    rescue => error
      render json: {error: error.message}
    end

  end

  def count_by_day_and_groups
    begin
      @complaints = Complaint.count_by_date_and_groups(params[:groups], Complaint::DAY)
      @complaints = ComplaintsHelper.transform_date_group_queries(@complaints)
      render json: @complaints
    rescue => error
      render json: {error: error.message}
    end
  end

  def count_by_month_and_groups
    begin
      @complaints = Complaint.count_by_date_and_groups(params[:groups], Complaint::MONTH)
      @complaints = ComplaintsHelper.transform_date_group_queries(@complaints)
      render json: @complaints
    rescue => error
      render json: {error: error.message}
    end
  end

  def count_by_area_with_lat_long
    lat = params[:latitude]
    long = params[:longitude]
    radius = params[:radius]
    groups = params[:groups]
    @complaints = Complaint.query_by_location(radius, [lat, long], groups)
    @complaints = ComplaintsHelper.transform_date_group_queries(@complaints)
    render json: @complaints
  end

  def count_by_area_with_address
    address = params[:address]
    radius = params[:radius]
    groups = params[:groups]
    @complaints = Complaint.query_by_location(radius, address, groups)
    @complaints = ComplaintsHelper.transform_date_group_queries(@complaints)
    render json: @complaints
  end

  def info_by_groups
    @complaints = Complaint.build_group_query(params[:groups])
    render json: @complaints
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def api_params
      params.permit(:address, :latitude, :longitude, :radius, groups:[])
    end
end
