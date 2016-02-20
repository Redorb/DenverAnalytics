require 'csv'

namespace :data_migration do
  desc "Imports CSV into rails database"
  task csv_import: :environment do
    file_name = File.join Rails.root, "clean.csv"
    CSV.foreach(file_name, headers: true) do |row|
      row_hash = row.to_hash
      Complaint.create!(
                   case_summary: row_hash['case_summary'],
                   case_status: row_hash['case_status'],
                   case_source: row_hash['case_source'],
                   case_created: row_hash['case_created'].nil? ? nil : DateTime.strptime(row_hash['case_created'], '%m/%d/%Y %H:%M:%S %p'),
                   case_closed: row_hash['case_closed'].nil? ? nil : DateTime.strptime(row_hash['case_closed'], '%m/%d/%Y %H:%M:%S %p'),
                   first_call_resolution: row_hash['first_call_resolution'],
                   customer_zip_code: row_hash['customer_zip_code'],
                   incident_address_one: row_hash['incident_address_one'],
                   incident_address_two: row_hash['incident_address_two'],
                   incident_intersection_one: row_hash['incident_intersection_one'],
                   incident_intersection_two: row_hash['incident_intersection_two'],
                   incident_zip_code: row_hash['incident_zip_code'],
                   longitude: row_hash['longitude'],
                   latitude: row_hash['latitude'],
                   agency: row_hash['agency'],
                   division: row_hash['division'],
                   major_area: row_hash['major_area'],
                   type: row_hash['type'],
                   topic: row_hash['topic'],
                   council_district: row_hash['council_district'],
                   police_district: row_hash['police_district'],
                   neighborhood: row_hash['neighborhood']
      )
    end
  end

end
