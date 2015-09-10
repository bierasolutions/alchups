require 'csv'

namespace :tanks do
  desc "task import alchups data"
  task :import => :environment do
    CSV.foreach("data/alchups.csv", :headers => true) do |row|
      Tank.create!(
        :title => row[1].split.map(&:capitalize).join(' '),
        :notes => row[4],
        :x => row[7],
        :y => row[8]
      )
    end
  end
end

