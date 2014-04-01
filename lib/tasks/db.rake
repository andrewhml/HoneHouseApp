require_relative '../build_test_data'
namespace :db do
  desc "reset database with test data"
  task :reset, [:num] => [:environment] do |t, args|
    if (ENV['RAILS_ENV'] != "production")
      binding.pry
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:schema:load'].invoke
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
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:schema:load'].invoke
      Rake::Task['db:seed'].invoke
    end
  end

end
