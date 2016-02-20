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

  def full_count_by_date
    @complaints = Complaint.where("case_created IS NOT NULL").group("SUBSTR(case_created,1,10)").count
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

  def count_by_date_and_groups
    begin
      @complaints = Complaint.where("case_created IS NOT NULL").group("SUBSTR(case_created,1,10)")
      build_group_query_with_count
      render json: @complaints
    rescue => error
      render json: {error: error.message}
    end
  end

  def complaints_by_area_from_coords
    @complaints = Complaint.where("case_summary IS NOT NULL").group('case_summary').within(0.2, :origin => [39.691552,-104.978432]).count
    render json: @complaints
  end

  def info_by_groups
    build_group_query
    render json: @complaints
  end

  private
    def build_group_query
      params[:groups].each do |group|
        group = group.downcase
        unless VALID_GROUPING_COLS.include?(group)
          raise "#{group} is not a valid group, choose from #{VALID_GROUPING_COLS}"
        end

        @complaints = @complaints.where("#{group} IS NOT NULL").group(group)
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
