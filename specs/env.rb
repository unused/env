
require_relative './role_run'
require_relative './container'

# Test container image should have a unique name that must be set when running
# the testsuite.
IMAGE = ENV.fetch 'IMG'

# We choose a random container name.
CONTAINER = "#{IMAGE}-#{rand(1000...9999)}"

# Read the absolute path of our env-project directory.
BASE_DIR = File.expand_path("#{__dir__}/../")

# We require our tests to finish before 10 minutes.
SLEEP_CMD = 'sleep 600'

# Print debug output.
DEBUG = true
