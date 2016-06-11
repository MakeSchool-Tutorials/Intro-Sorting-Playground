import XCPlayground
let deck = Deck(comparator: suiteFirstComparator)
let (sceneView, scene) = CardSortScene.setupScene(deck)
/*:
Don't worry about the code here – this sets up the deck of cards that we'll be manipulating, and the scene that displays it.
*/

//: [Previous](@previous)

/*:

# Merge Sort: A divide-and-conquer algorithm

So far, we've implemented _iterative_ sorting algorithms – ones that go through each of the elements in the array, and run some operation on each of them. This time, we're going to look at our first _recursive_ sorting algorithm: Merge sort. The concept is as follows:

1. We pick a chunk of the array, and mark its start and end position. For starters, we'll pick the entire array.
2. Does this chunk have more than 1 element? If so, we'll split it up into two chunks. Call `mergesort()` on each of these chunks, with new marked start and end positions. If the chunk has 1 or less elements, we can return.
3. Since we've called `mergesort` on both chunks already, we assume that each chunk has been independently sorted. Now, all we need to do is to _merge_ these two sorted chunks together into one sorted chunk:
4. Run two counters that start on the start index of both the chunks. Which is smaller? Pick the smaller one and swap it with the first position of the chunk, and increment the counter that got picked. Repeat until both counters have finished counting all elements in their chunks!

A nice animation of what this entails (taken from [Wikipedia's page on Merge Sort](https://en.wikipedia.org/wiki/Merge_sort):
![](mergesort.gif)

To help you get started with this, we've given you some code to begin with. Note that there are two functions. Since this algorithm is recursive by nature, you're going to be calling the version mergesort that takes two parameters, to keep track of which chunk you are working on. The parameter-less merge sort is called from the top level, which simply invokes `mergesort` with startIndex at 0 and endIndex at _one after_ the last index, or the length of the array.

We've also given you the `<` comparator implementation from last time, so that you can simply compare cards by suite order, then rank.

Good luck!

*/
extension Deck {
    public func mergesort() {
        mergesort(0, endIndex: cards.count)
    }
    
    public func mergesort(startIndex: Int, endIndex: Int) {
        
    }
}
deck.mergesort()

let numCardsInSuite = 13

public func <(first: Card, second: Card) -> Bool {
    return first.suite.rawValue * numCardsInSuite + first.value < second.suite.rawValue * numCardsInSuite + second.value
}


//: [Next](@next)














/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
sceneView.presentScene(scene);
XCPlaygroundPage.currentPage.liveView = sceneView;
