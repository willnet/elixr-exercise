defmodule Parallel do
  def pmap(collection, func) do
    collection
    |> Enum.map(&(Task.async(fn -> func.(&1) end)))
    |> Enum.map(&Task.await/1)
  end
end

result = Parallel.pmap 1..10, &(&1 * &1)
# おそらく戻り値リストなので、数値は表示されない
IO.puts result #=> $1@Qd
