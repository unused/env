require 'minitest/autorun'
require_relative './env'

class TestRoleRun < Minitest::Test
  def setup
    @run = RoleRun.new 'minecraft'
  end

  def test_it_forwards_message
    @done = false
    callback = ->(_cmd) { @done = true }
    @run.(callback)
    assert @done
  end

  def test_it_parses_output
    out = <<~OUTPUT
      Installing some stuff...
      PLAY RECAP *****************************************************
      localhost : ok=7    changed=3  failed=0  skipped=0  ignored=0
    OUTPUT
    @run.instance_variable_set :@result, out
    assert @run.success?
  end

  def test_it_detects_errors
    out = <<~OUTPUT
      Installing some stuff...
      PLAY RECAP *****************************************************
      localhost : ok=7    changed=3  failed=1  skipped=0  ignored=0
    OUTPUT
    @run.instance_variable_set :@result, out
    refute @run.success?
  end
end
