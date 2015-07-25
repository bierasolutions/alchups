require 'csv'

namespace :tanks do
  desc "task import alchups data"
  task :import => :environment do
    CSV.foreach("data/alchups.csv", :headers => true) do |row|
      Tank.create!(
        :title => row[1],
        :notes => row[4],
        :longitude => row[5],
        :latitude => row[6]
      )
    end
  end
end

