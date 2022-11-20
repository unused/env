# Run a ansible playbook by role tag, store the result, and check the play
# recap output for any failed tasks.
class RoleRun
  def initialize(role)
    @role = role
  end

  def call(container)
    @result = container.("make update TAGS=#{@role}")
    self
  end

  def success?
    File.write "#{BASE_DIR}/log/#{@role}.log", @result

    recap.fetch(:failed) == 0
  end

  private

  # Read the line after `PLAY RECAP` and interpret the summary.
  def recap
    @result.lines[index_of_recap].split(' ').inject({}) do |result, item|
      next result unless item.include? '='

      key, value = item.split '=', 2
      result[key.to_sym] = value.to_i
      result
    end
  end

  # Provide the index of the line after `PLAY RECAP`.
  def index_of_recap
    @result.lines.find_index { |line| line.start_with? 'PLAY RECAP' } + 1
  end
end
