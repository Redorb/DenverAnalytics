require 'csv'

namespace :data_migration do
  desc "Imports CSV into rails database"
  task csv_import: :environment do
    file_name = File.join Rails.root, "311_service_requests.csv"
    CSV.foreach(file_name, headers: true) do |row|
      puts row.to_hash
      #Complaint.create!(row.to_hash)
    end
  end

end
