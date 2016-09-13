/*:
 ![Make School Banner](./swift_banner.png)
 # Merge Sort: A divide-and-conquer algorithm
 
 So far, we've implemented _iterative_ sorting algorithms – ones that go through each of the elements in the array and run some operation on each of them. This time, we're going to look at our first _recursive_ sorting algorithm: _Merge Sort_. The algorithm is split into two parts: divide & conquer (or merge).
 
 ## Divide
 
 1. Divide an `Array` into two new `Array`s at the middle
 2. Continue doing this divide until you cannot do it anymore
 
 ## Conquer (or merge)
 
 Since we've called `mergeSort` on both chunks already, we assume that each chunk has been independently sorted. Now, all we need to do is to _merge_ these two sorted chunks together into one sorted chunk.
 
 ## Visual representation
 
 This algorithm makes a lot more sense when seen visually (from [Wikipedia's page on Merge Sort](https://en.wikipedia.org/wiki/Merge_sort)):
 
 ![](mergesort.gif)
 
 ## I'm still a bit confused...
 
 Let's check in with the dancers again! Check it out in action [here](https://www.youtube.com/watch?v=XaqR3G_NVoo).
 
 - callout(Crazy Challenge): Try writing out the pseudocode for _Merge Sort_ and compare it with a partner. Get a deck of cards and try it out your pseudocode with 10 cards (`Ace` through `Jack`).
 
 */

//: [Previous](@previous)
