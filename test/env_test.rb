require 'minitest/autorun'
require_relative './env'

# Minitest.after_run { `podman rm -f #{IMAGE}-*` }

# Run every role of our playbook in a containerized environment. The testsuite
# will start a container of the provided `IMG` env variable.
class TestEnv < Minitest::Test

  # Note that we start (and remove) a fresh container for every test.
  def setup
    @container = Container.new IMAGE
    raise 'failed to setup container' unless @container.start
  end

  def teardown
    raise 'failed to remove container' unless @container.stop
  end

  # Create a test for each directory roles, so for each role.
  Dir.glob("#{BASE_DIR}/roles/*").each do |role_dir|
    role = File.basename(role_dir)

    define_method :"test_role_#{role}" do
      assert RoleRun.new(role).(@container).success?
    end
  end
end
