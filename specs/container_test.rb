require 'minitest/autorun'

require_relative './env'

class TestContainer < Minitest::Test
  class TestRunner
    attr_reader :commands
    def call(cmd)
      @commands ||= []
      @commands << cmd
    end
  end

  def setup
    @runner = TestRunner.new
    @container = Container.new 'image-name', @runner
  end

  def test_container_name_length
    assert_equal @container.name.length, ('image-name'.length + '-xxxx'.length)
  end

  def test_it_starts_a_container
    @container.start
    assert @runner.commands.last.start_with? 'podman run'
  end

  def test_it_mounts_workdir
    mount = "-v #{BASE_DIR}:\/"
    @container.start
    assert @runner.commands.last.include? mount
  end

  def test_it_stops_a_container
    @container.stop
    assert @runner.commands.last.start_with? 'podman stop image-name-'
  end

  def test_it_runs_a_process
    @container.('ls -l')
    assert @runner.commands.last.start_with? 'podman exec -t image-name-'
  end
end
