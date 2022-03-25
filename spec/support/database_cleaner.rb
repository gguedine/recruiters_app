RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  #
  # config.before(:each) { DatabaseCleaner.start }
  # config.after(:each) { DatabaseCleaner.clean }
end