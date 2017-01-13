
def configure_database_cleaner(rspec_config)
  require 'database_cleaner'

  DatabaseCleaner.clean

  rspec_config.before(:suite) do
    begin
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end

  rspec_config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
rescue DatabaseCleaner::NoORMDetected
  puts 'DatabaseCleaner not necessary you are not using a Database'
rescue LoadError
  puts 'DatabaseCleaner is not installed'
end
