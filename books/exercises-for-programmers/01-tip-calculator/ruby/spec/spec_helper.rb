require 'stringio'

module Helpers
  def mock_io(value = 'mock')
    StringIO.new(value)
  end
end

RSpec.configure do |config|
  config.color = true
  config.include Helpers
end
