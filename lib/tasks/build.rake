require_relative '../build_test_data'
namespace :build do
  desc "create test data"
  task test_data: :environment do |t, args|
    if (ENV['RAILS_ENV'] != "production")
      if ARGV[1]
        begin
          num = Integer(ARGV[1])
        rescue ArgumentError => e
          if e
            num = 10
          end
        end
      end
      TestData.build(num)
    end
  end

end
