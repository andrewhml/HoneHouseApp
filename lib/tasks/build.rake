require_relative '../build_test_data'
namespace :build do
  desc "create test data"
  task :test_data, [:num] => [:environment] do |t, args|
    if (ENV['RAILS_ENV'] != "production")
      if args.num
        begin
          num = Integer(args.num)
        rescue ArgumentError => e
          if e
            num = 10
          end
        end
      else
        num = 10
      end
      TestData.build(num)
    else
      puts 'This rake task is not available in the production environment.'
    end
  end

end
