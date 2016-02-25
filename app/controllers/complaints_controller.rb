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
      @complaints = transform_date_group_queries(@complaints)
      render json: @complaints
    rescue => error
      render json: {error: error.message}
    end
  end

  def count_by_month_and_groups
    begin
      @complaints = Complaint.count_by_date_and_groups(params[:groups], Complaint::MONTH)
      @complaints = transform_date_group_queries(@complaints)
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
    @complaints = transform_date_group_queries(@complaints)
    render json: @complaints
  end

  def count_by_area_with_address
    address = params[:address]
    radius = params[:radius]
    groups = params[:groups]
    @complaints = Complaint.query_by_location(radius, address, groups)
    @complaints = transform_date_group_queries(@complaints)
    render json: @complaints
  end

  def info_by_groups
    @complaints = Complaint.build_group_query(params[:groups])
    render json: @complaints
  end

  private
    # Because of the weird and annoying way that active record
    # returns groupings with the group collection set as a the
    # key and the count as its value I have to massage the data to make
    # it look sane for the front end.
    # Example transformation:
    #     ["2014-08-29", "10 Min. Grace"]: 2,
    #     ["2014-08-29", "311 - General Inquiry"]: 49,
    #     ["2014-08-29", "311 Compliment"]: 1,
    #  =>
    # 10 Min. Grace: {
    #     2014-08: 2,
    #     2014-09: 17,
    #     2014-10: 17,
    #     2014-11: 11,
    #
    # So the below set groups the set on date first and then fixes the resulting
    # pairing in the newly created hash map of dates. Multiple groups are concatenated
    # with | to create a unique hash
    def transform_date_group_queries(complaints)
      cmprsd_topics_key_hash = {}
      complaints.each { |k, v|
      	date = k[0]
      	topic_key = k[1..-1].join('|')
      	count = v
      	cmprsd_topics_key_hash[topic_key] ||= {}
      	cmprsd_topics_key_hash[topic_key][date] = count
      }
      cmprsd_topics_key_hash
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_params
      params.permit(:address, :latitude, :longitude, :radius, groups:[])
    end
end
