# This is the solution for the Karate Chop question in elixir
# Karate Chop aka Binary chop/search , we'll solve this problem recursively
# Dividing the sorted input array in half every time we perform recursion
# We'll keep recursing until the base case is reached or the item is found.

# Constraints: Input Array needs to be sorted.
# Time Complexity: O(log n)

defmodule KarateChop do
  # Base Case: We'll return -1 if the item is not found
  def bin_search(_array, left, right, _x) when left > right do
    -1
  end

  # Search Function:
  # array is The sorted input Array
  # left is the starting index of the array i.e 0 and right is the last index of array i.e array.length - 1
  # x is the item to be searched
  def bin_search(array, left, right, x) do
    # we're finding mid of the array using div function which does integer division (not float division)
    mid = div(left + right, 2)

    cond do
      # if the item < mid, then the item is present in left side of the array, so we ignore the right side
      x < Enum.at(array, mid) ->
        bin_search(array, left, mid - 1, x)

      # if the item > mid, then the item is present in right side of the array, so we ignore the left side
      x > Enum.at(array, mid) ->
        bin_search(array, mid + 1, right, x)

      # if item == mid, we return mid which is the index where the item is present.
      x == Enum.at(array, mid) ->
        mid
    end
  end
end

# Sorted input array
array = [1, 2, 3, 4, 5]

x = 1

# we're storing result of store function in index variable
index = KarateChop.bin_search(array, 0, Enum.count(array) - 1, x)

# Printing the result
IO.puts("\nInput Array is:")
IO.inspect(array)
IO.puts("\nItem searched is #{x}")

if index == -1 do
  IO.puts("\nItem not found\n")
else
  IO.puts("\nItem found at index: #{index}\n")
end
