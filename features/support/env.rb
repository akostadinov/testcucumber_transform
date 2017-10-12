## add our lib dir to load path
$LOAD_PATH << File.expand_path("#{__FILE__}/../../../lib")

require 'world'

World do
  ::World.new
end

After do |_scenario|
  teardown
end
