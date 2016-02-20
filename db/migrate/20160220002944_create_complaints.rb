class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :case_summary
      t.string :case_status
      t.string :case_source
      t.datetime :case_created
      t.datetime :case_closed
      t.string :first_call_resolution
      t.string :customer_zip_code
      t.string :incident_address_one
      t.string :incident_address_two
      t.string :incident_intersection_one
      t.string :incident_intersection_two
      t.string :incident_zip_code
      t.string :longitude
      t.string :latitude
      t.string :agency
      t.string :division
      t.string :major_area
      t.string :type
      t.string :topic
      t.integer :council_district, :default => 0
      t.integer :police_district, :default => 0
      t.string :neighborhood

      t.timestamps null: false
    end
  end
end
