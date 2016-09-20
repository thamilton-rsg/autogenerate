module AutoGenerate
  #
  # This is the main class in which we interact with thread
  # job creation and execution.
  #
  class Pool
    #
    # Create the initial size of the pool of threads to use.
    #
    # @param [Integer] pool_size
    #
    def initialize(pool_size)
      @pool_size = pool_size
      @queue = Queue.new

      @threads = Array.new(@pool_size) do
        Thread.new do
          until @queue.empty?
            jobs, args = @queue.shift
            jobs.call(*args)
          end
        end
      end

    end

    #
    # Schedule job in queue.
    #
    # @param [Integer] job_count
    # @param [Array] args
    #
    def schedule(job_count, *args, &block)
      job_count.times.each do
        @queue << [block, args]
      end
    end

    #
    # Run all jobs in queue.
    #
    def run
      @threads.each(&:join)
    end

  end # => end Pool
end # => end AutoGenerate