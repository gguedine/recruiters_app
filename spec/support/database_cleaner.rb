# RSpec.configure do |config|
#
#   config.before(:suite) do
#     DatabaseCleaner.clean_with(:truncation)
#   end
#
#   config.before(:each) do
#     DatabaseCleaner.strategy = :transaction
#   end
#
#   config.before(:each, js: true) do
#     DatabaseCleaner.strategy = :truncation
#   end
#
#   config.before(:each) do
#     DatabaseCleaner.start
#   end
#
#   config.after(:each) do
#     DatabaseCleaner.clean
#   end
#
# end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:deletion, except: %w[ar_internal_metadata])
  end

  config.before(:each) do |spec|
    if spec.metadata[:js]
      # ActiveRecord::Base.connection.raw_connection.autocommit = true
      DatabaseCleaner.strategy = :deletion
    else
      DatabaseCleaner.strategy = :transaction
    end
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }
end

ActiveRecord::Base.connection.execute 'SET FOREIGN_KEY_CHECKS=0;'