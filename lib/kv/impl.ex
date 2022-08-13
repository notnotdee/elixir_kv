defmodule KV.Impl do
  def new() do
    %{}
  end

  def lookup(names, name) do
    Map.fetch(names, name)
  end

  def create(names, name, value) do
    Map.put(names, name, value)
  end

  def delete(names, name) do
    Map.delete(names, name)
  end

  def remove_by_key(refs, ref) do
    Map.pop(refs, ref)
  end
end
