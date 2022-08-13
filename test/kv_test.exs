defmodule KVTest do
  use ExUnit.Case, async: true

  setup do
    registry = KV.start_link()

    %{registry: registry}
  end

  test "spawns buckets", %{registry: registry} do
    assert KV.lookup(registry, "shopping") == :error

    KV.create(registry, "shopping")
    assert {:ok, bucket} = KV.lookup(registry, "shopping")

    KV.Bucket.put(bucket, "milk", 1)
    assert KV.Bucket.get(bucket, "milk") == 1
  end

  test "removes buckets on exit", %{registry: registry} do
    KV.create(registry, "shopping")
    {:ok, bucket} = KV.lookup(registry, "shopping")
    Agent.stop(bucket)
    assert KV.lookup(registry, "shopping") == :error
  end
end
