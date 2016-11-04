require 'csv'
namespace :csvimport do
  desc "Import CSV Data."

  task :import_college => :environment do
	  csv_file_path = 'db/university_list.csv'

    CSV.foreach(csv_file_path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      p = EducationSchool.create!({
          :school => row[1],
          
        }
      )

    end
  end
end