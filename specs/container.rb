
# A podman container that can be started, used to exec a process within, and
# stopped. As we start containers with `--rm` flag, there is no need to remove
# them afterwards.
#
# Please note that we do not check if a container has been started properly or
# is active at time of requesting a command execution.
class Container
  CMD = 'podman'
  TIMEOUT = 600

  attr_reader :name, :image, :state

  def initialize(image, runner = Kernel.method(:system))
    @name = "#{image}-#{rand(1000...9999)}"
    @image = image
    @runner = runner
  end

  def call(cmd)
    puts "[#{Time.now}] EXEC: #{CMD} exec -it #{name} #{cmd}" if DEBUG
    @runner.("#{CMD} exec -it #{name} #{cmd}")
  end

  def start
    args = "-d --rm --name #{name}"
    mount = "-v #{BASE_DIR}:/home/me/env/:Z"
    @runner.("#{CMD} run #{args} #{mount} #{image} #{SLEEP_CMD}")
  end

  def stop
    @runner.("#{CMD} stop #{name}")
  end
end
