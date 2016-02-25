class Complaint < ActiveRecord::Base
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  VALID_GROUPING_COLS = [ 'case_summary',
                          'agency',
                          'division',
                          'type',
                          'topic',
                          'council_district',
                          'police_district',
                          'major_area',
                          'neighborhood',
                          'case_status' ]

  MONTH = 7
  DAY = 10

  self.inheritance_column = nil

  def self.full_count_by_date(time_frame)
    complaints = query_on_date(time_frame)
    complaints.count
  end

  def self.query_on_date(time_frame, complaints=self)
    complaints.where("case_created IS NOT NULL").group("SUBSTR(case_created,1,#{time_frame})")
  end

  def self.count_by_date_and_groups(groups, time_frame)
    complaints = query_on_date(time_frame)
    build_group_query_with_count(groups, complaints)
  end

  def self.build_group_query_with_count(groups, complaints)
    complaints = build_group_query(groups, complaints)
    complaints.count
  end

  def self.build_group_query(groups, complaints=self)
    groups.each do |group|
      group = group.downcase
      unless VALID_GROUPING_COLS.include?(group)
        raise "#{group} is not a valid group, choose from #{VALID_GROUPING_COLS}"
      end

      complaints = complaints.where("? IS NOT NULL", group).group(group).having("count(?) > 1", group)
    end
    complaints
  end

  def self.query_by_location radius, location, groups
    complaints = Complaint.within(radius, :origin => location)
    complaints = query_on_date(MONTH, complaints)
    build_group_query_with_count(groups, complaints)
  end
end
