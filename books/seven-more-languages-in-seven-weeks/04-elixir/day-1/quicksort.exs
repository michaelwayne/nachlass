defmodule QuickSort do
  def sort([]), do: []
  def sort([head|tail]) do
    sort( for(x <- tail, x <= head, do: x) ) ++
    [head] ++
    sort( for(x <- tail, x > head, do: x) )
  end
end