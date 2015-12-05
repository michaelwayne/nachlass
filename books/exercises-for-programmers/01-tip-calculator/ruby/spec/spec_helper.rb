require 'stringio'

module Helpers
  def mock_io(input: 'mock', output: 'mock')
    { input: StringIO.new(input), output: StringIO.new(output) }
  end
end

RSpec.configure do |config|
  config.color = true
  config.include Helpers
end
