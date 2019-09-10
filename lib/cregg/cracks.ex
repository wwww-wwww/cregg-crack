defmodule Cregg.Cracks do
  use Agent
  
  def start_link(opts) do
    Agent.start_link(fn -> 0 end, opts)
  end

  def get_cracks(pid) do
    Agent.get(pid, fn val ->
      val
    end)
  end
  
  def add_crack(pid) do
    Agent.update(pid, fn val ->
      val + 1
    end)
  end
end
