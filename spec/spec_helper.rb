$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'tiny-template'

Dir[File.join('spec', 'support', '**', '*.rb')].each { |f| load f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'
end
