module AutoGenerate
  #
  # This is the main class in which we interact with the
  # Pool class to add/execute schedule jobs.
  #
  module Generator
    #
    # Create the initial pool size and schedule job.
    #
    # @param [Integer] pool_size
    # @param [Integer] job_count
    #
    def self.execute(pool_size, job_count=1)
      thread = AutoGenerate::Pool.new(pool_size)

      thread.schedule(job_count) do
        yield if block_given?
      end
      thread.run
    end

  end # => end Generator
end # => end AutoGenerate