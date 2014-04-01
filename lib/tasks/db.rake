namespace :db do
  desc "reset database with test data"
  task reset: :environment do |t, args|
    if (ENV['RAILS_ENV'] != "production")
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:schema:load'].invoke
      Rake::Task["build:test_data"].invoke
    else
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:schema:load'].invoke
      Rake::Task['db:seed'].invoke
    end
  end

end
