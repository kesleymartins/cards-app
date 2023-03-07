class ExecutionStatus < EnumerateIt::Base
  associate_values(
    :running,
    :closed
  )
end
