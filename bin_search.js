//  This is the solution for the Karate Chop question in javascript
//  Karate Chop aka Binary chop/search , we'll solve this problem recursively
//  Dividing the sorted input array in half every time we perform recursion
//  We'll keep recursing until the base case is reached or the item is found.

//  Constraints: Input Array needs to be sorted.
//  Time Complexity: O(log n)


//  Search Function:
//  array is The sorted input Array
//  left is the starting index of the array i.e 0 and right is the last index of array i.e array.length - 1
//  x is the item to be searched
const chop = (array, left, right, x) => {
    if (right >= left) {
        // We use the Math.floor function for division bcoz we want integer division, not float
         mid = left + Math.floor((right - left) / 2);
 
        // If the item is present at the middle, we'll return the mid coz the item is present at mid.
        if (array[mid] == x)
            return mid;
 
        // If item is smaller than mid, then the item is present in left array
        if (array[mid] > x)
            return chop(array, left, mid - 1, x);

        // else the item is present in the right side of the array
        return chop(array, mid + 1, right, x);
    }
 
    // Base Case
    // If element not present return -1
    return -1;
}

    // Sorted Array
    const arr = [2, 3, 4, 10, 40];
    // Item to be searched
    const x = 51;
    // Size of the array
    let n = arr.length;

    // Storing result of search function in index variable
    const index = chop(arr, 0, n - 1, x);
    
    // Printing the result
    console.log(`\nInput Array is: ${arr}`)
    console.log(`\nItem searched is: ${x}`)

    index === -1 ? console.log(`\nItem not found\n`) : console.log(`\nItem found at index: ${index}\n`)