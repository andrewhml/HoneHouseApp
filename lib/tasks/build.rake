require_relative '../build_test_data'
namespace :build do
  desc "create test data"
  task test_data: :environment do |t, args|
    if ((ENV['RAILS_ENV'] == "test") || (ENV['RAILS_ENV'] == "development"))
      TestData.build
  end

end
