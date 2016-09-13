/*:
 ![Make School Banner](./swift_banner.png) 
 # Accessing Card values
 
 Before we start, we should show you how to retrieve information from the `Card` _structs_ that make up our array. You can retrive the number `value` of a card like this:
 
     let firstCard = cards[0]
     let value = firstCard.value
 
 Similarly, you can retrieve the suit of a card, like this:
 
     let suit = firstCard.suit
 
 We won't be dealing with suits just yet, though. You can continue to treat them all as equal!
 
 # Our First Sorting Algorithm: Bubble Sort!
 
 The idea behind _Bubble Sort_ is to repeatedly "bubble" up the larger elements towards the end of array! We do this over and over again until our `Array` is sorted. Sound like magic?
 
 Before we get into coding this, let's check it out in dance form [here](https://www.youtube.com/watch?v=lyZQPjUT5B4)!
 
 - callout(Challenge): The sorting magic starts _53 seconds_ into the video but you should just start from the beginning. As you watch, try to write out pseudocode for the algorithm on pen and paper. Save this so you can compare it to the pseudocode we give you later in this section!
 
 ## How it works
 
 Let's imagine you inspect the first two cards of the deck. You compare the two cards -- does the first card have the higher value? _If_ it does, _swap_ the two cards. Now those two cards are in ascending order!
 
     if card 0 is greater than card 1
         swap card 0 and card 1
 
 Well, great. Now what about the rest of the cards? Worry not! We'll go ahead and do the same thing for the next pair of cards. And the next pair. And the next... until we reach the end of the array.
 
    for index from 0 to (number of cards - 2)
        if card index is greater than card (index + 1)
            swap card index and card (index + 1)
 
 ### Why does the for loop go from (number of cards - 2)?
 
 - callout(Solution): Remember that array indices go from `0` to `count - 1`, and that we're inspecting pairs of `index` and `index + 1`. If we iterate `index` from `0` to `count - 1`, `index + 1` would be outside the array bounds!
 
 ## Code it out!
 
 Go ahead and write translate the above pseudocode into Swift! Does it sort your list?
 
 - callout(Remember): You can loop over values in a range with:
 
        for counterVariable in startValue...endValue {
 
        }
 
 */

extension Deck {
    func bubbleSort() {
        // Implement this!
        
    }
}

/*:
 
 ### It's still not sorted! :(
 
 Well, that didn't sort the deck completely. But you'll notice, that the largest card has "bubbled" to the end of the array! If we do this multiple times, we'll get the next largest card to be at one before the end, the next next largest card to be two before the end, and so on.
 
 When you go through this process the second time, you don't need to compare the last two cards, since the last card is already in place. This also holds true for the next iteration: in the third run, the last two cards are in place, and so on...
 
 - callout(Challenge): Translate the full implementation into pseudocode! How close was your pseudocode from when you were watching the video?
 
 ## Moment of truth
 
 - callout(Challenge): Modify the `bubbleSort()` function above to finish sorting the cards!
 
 
 - callout(Hint): It involves wrapping our existing code into _another_ for loop, and then modifying the variables that determine when the "bubbling" process ends.
 
    You can reverse a range with `.reverse()`. `(1...5)` would produce `1, 2, 3, 4, 5` but `(1...5).reverse()` produces `5, 4, 3, 2, 1`.
 
 # Did you do it?
 
 Congratulations, your array is now sorted! How do you feel about _Bubble Sort_? Is it how you would sort a deck of cards?
 
 Perhaps you're not satisfied. Maybe this sorting algorithm didn't seem very efficient to you. It sort of defies common sense. When you are sorting cards by hand you probably move the largest card to the end of the hand and then repeat the process. You likely _scan_ through the pile looking for the largest value, instead of comparing each card against its neighbor and doing this bubbling process. We'll explore this room for improvmeent in the next section and introduce a faster sorting algorithm called Selection Sort.
 
 */
//: [Previous](@previous) | [Next](@next)
/*:
 Don't worry about this code. This takes the scene and deck information and displays it.
 */
import PlaygroundSupport
let deck = Deck(comparator: valueOnlyComparator, seed: true)
let (sceneView, scene) = CardSortScene.setupScene(deck)
sceneView.presentScene(scene)
PlaygroundPage.current.liveView = sceneView
deck.bubbleSort()
