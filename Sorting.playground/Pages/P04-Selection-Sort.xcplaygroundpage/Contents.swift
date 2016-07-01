/*:
 ![Make School Banner](./swift_banner.png)
 # A faster sorting algorithm: Selection Sort
 
 _Selection sort_ is perhaps what you first think of when sorting an `Array`. Before we get started, let's check in with the dancers again! Check it out in action [here](https://www.youtube.com/watch?v=Ns4TPTC8whw).
 
  - callout(Challenge): As you watch, try to write out pseudocode for the algorithm on pen and paper. Save this so you can compare it to the pseudocode we give you later in this section!
 
 ## How it works
 
 1. Find the lowest value in the array. Keep track of which index that card resides at.
 2. Swap the lowest card with the first card.
 3. Repeat steps 1 and 2 by finding the lowest card in the rest of the array. On step 2, swap with the first card in the unsorted section.
 
 - callout(Challenge): Translate the above steps into a full pseudocode implementation. How close were you to your original guess with the dancers? Check your implementation with a partner or instructor before getting started!
 
 ## Code it out!
 
 Go ahead and write translate your pseudocode into Swift in the `selectionSort` function below.
 
 */

extension Deck {
    func selectionSort() {
        //Student code here!
        
    }
}

/*:
 # Did you do it?
 
 Congratulations, your array is now sorted! How do you feel about _Selection Sort_? Do you think we can do better?
 
 */
//: [Previous](@previous) | [Next](@next)
/*:
 Don't worry about this code. This takes the scene and deck information and displays it.
 */
import XCPlayground
let deck = Deck(comparator: valueOnlyComparator)
let (sceneView, scene) = CardSortScene.setupScene(deck)
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
deck.selectionSort()
