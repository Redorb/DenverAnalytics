class ComplaintsController < ApplicationController
  VALID_GROUPING_COLS = [ 'case_summary',
                          'agency',
                          'division',
                          'type',
                          'topic',
                          'council_district',
                          'police_district',
                          'major_area',
                          'neighborhood' ]
  MONTH = 7
  DAY = 10

  def index

  end

  def full_count_by_month
    full_count_by_date(MONTH)
    render json: @complaints
  end

  def full_count_by_day
    full_count_by_date(DAY)
    render json: @complaints
  end

  def count_by_groups
    begin
      @complaints = Complaint
      build_group_query
      @complaints = @complaints.count
      render json: @complaints
    rescue => error
      render json: {error: error.message}
    end

  end

  def count_by_day_and_groups
    begin
      result = count_by_date_and_groups(DAY)
      render json: result
    rescue => error
      render json: {error: error.message}
    end
  end

  def count_by_month_and_groups
    begin
      result = count_by_date_and_groups(MONTH)
      render json: result
    rescue => error
      render json: {error: error.message}
    end
  end

  def count_by_area
    @complaints = Complaint
                      .where("case_summary IS NOT NULL")
                      .group('case_summary')
                      .within(0.2, :origin => [39.691552,-104.978432])
                      .count
    render json: @complaints
  end

  def info_by_groups
    @complaints = Complaint
    build_group_query
    render json: @complaints
  end

  private
    def query_on_date(time_frame)
      @complaints = Complaint.where("case_created IS NOT NULL").group("SUBSTR(case_created,1,#{time_frame})")
    end

    def count_by_date_and_groups(time_frame)
      query_on_date(time_frame)
      build_group_query_with_count
      transform_date_group_queries
    end

    def full_count_by_date(time_frame)
      query_on_date(time_frame)
      @complaints = @complaints.count
    end

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
    # pairing in the newly created hash map of dates.
    def transform_date_group_queries
      @complaints = @complaints.map{ |c|
        [[c[0][0], c[0][1..-1].join('|')], c[1]]
      }
      byebug
      @complaints.group_by{|c| c[0][1]}.each_with_object({}) { |(k, v), hash|
        hash[k] = Hash[v.collect { |element|
          [element[0][0], element[1]]
        }]
      }
    end

    def build_group_query
      params[:groups].each do |group|
        group = group.downcase
        unless VALID_GROUPING_COLS.include?(group)
          raise "#{group} is not a valid group, choose from #{VALID_GROUPING_COLS}"
        end

        @complaints = @complaints.where("#{group} IS NOT NULL").group(group).having("count(#{group}) > 1")
      end
    end
    def build_group_query_with_count
      build_group_query
      @complaints = @complaints.count
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:with_group_date)
    end
end
