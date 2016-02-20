class ComplaintsController < ApplicationController
  def full_count_by_date
    @complaints = Complaint.where("case_created IS NOT NULL").group("SUBSTR(case_created,1,10)").count
    render json: @complaints
  end

  def count_by_date_group_on_summary
    render_complaints_with_group 'case_summary', params[:with_group_date]
  end

  def count_by_date_group_on_agency
    render_complaints_with_group 'agency', params[:with_group_date]
  end

  def count_by_date_group_division
    render_complaints_with_group 'division', params[:with_group_date]
  end

  def count_by_date_group_type
    render_complaints_with_group 'type', params[:with_group_date]
  end

  def count_by_date_group_topic
    render_complaints_with_group 'topic', params[:with_group_date]
  end

  def count_by_date_group_council_dist
    render_complaints_with_group 'council_district', params[:with_group_date]
  end

  def count_by_date_group_police_dist
    render_complaints_with_group 'police_district', params[:with_group_date]
  end

  def count_by_date_group_area
    render_complaints_with_group 'major_area', params[:with_group_date]
  end

  def count_by_date_group_neighborhood
    render_complaints_with_group 'neighborhood', params[:with_group_date]
  end

  def complaints_by_area_from_coords
    @complaints = Complaint.within(0.1, :origin => [39.691552,-104.978432]).count
    render json: @complaints
  end

  private
    def render_complaints_with_group group, with_group_date
      begin
        with_group_date = with_group_date.present? ? with_group_date.to_bool : true
        if with_group_date
          @complaints = count_by_date_group_on_column group
        else
          @complaints = count_group group
        end

        render json: @complaints
      rescue
        render json: {error: 'invalid param, only bool values are accepted'}
      end
    end

    def count_by_date_group_on_column column_name
      Complaint.where("case_created IS NOT NULL AND #{column_name} IS NOT NULL")
          .group(column_name).group("SUBSTR(case_created,1,10)").count
    end

    def count_group column_name
      Complaint.where("#{column_name} IS NOT NULL")
          .group(column_name).count
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def complaint_params
      params.require(:complaint).permit(:with_group_date)
    end
end
