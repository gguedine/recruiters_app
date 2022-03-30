# RSpec.configure do |config|
#
#
#   config.before(:suite) do
#     DatabaseCleaner.clean_with(
#       :truncation,
#       except: %w(ar_internal_metadata)
#     )
#   end
#
#   config.around(:each) do |example|
#     DatabaseCleaner.cleaning do
#       example.run
#     end
#   end
#   #
#   config.before(:each) { DatabaseCleaner.start }
#   config.after(:each) { DatabaseCleaner.clean }
# end
#
RSpec.configure do |config|
  config.use_transactional_fixtures = false

  # Use transactions by default
  config.before :each do
    DatabaseCleaner.strategy = :transaction
  end

  # For the javascript-enabled tests, switch to truncation, but *only on tables that were used*
  config.before :each, :js => true do
    DatabaseCleaner.strategy = :truncation, {:pre_count => true}
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end