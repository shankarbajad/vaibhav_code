require 'csv'
namespace :csvimport do
  desc "Import CSV Data."

  task :import_area_of_study => :environment do
	  csv_file_path = 'db/area_study_and_degree.csv'

     CSV.foreach(csv_file_path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      p = EducationSchool.create!({
          :degree => row[0],
          :area_of_study => row[1]
        }
      )

    end
  end
end