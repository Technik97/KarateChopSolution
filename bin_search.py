# This is the solution for the Karate Chop question in python
# Karate Chop aka Binary chop/search , we'll solve this problem recursively
# Dividing the sorted input array in half every time we perform recursion
# We'll keep recursing until the base case is reached or the item is found.

# Constraints: Input Array needs to be sorted.
# Time Complexity: O(log n)

# Search Function:
# arr is The sorted input Array
# left is the starting index of the array i.e 0 and right is the last index of array i.e array.length - 1
# x is the item to be searched
def binary_search(arr, left, right, x):
    # Base Case: If item not present return -1
    if left > right:
        return -1

    mid = (left + right) // 2

    # if item == mid, return mid bcoz item is present at mid
    if x == arr[mid]:
        return mid

    # If item is smaller than mid, then the item is present in left array
    elif x < arr[mid]:
        return binary_search(arr, left, mid - 1, x)

    #  If item is greater than mid, then the item is present in right array
    else:
        return binary_search(arr, mid + 1, right, x)


# Sorted input Array
arr = [1, 2, 3, 5, 7, 10]

# Item to be searched
x = 66

# Storing result of search function in indes variable
index = binary_search(arr, 0, len(arr) - 1, x)

# Printing the result
print(f"\nInput Array is: {arr}")

print(f"\nItem searched is: {x}")

print("\nItem not found\n" if index == -
      1 else f"\nItem found at index: {index}\n")
