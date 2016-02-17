import XCPlayground
let deck = Deck()
let (sceneView, scene) = CardSortScene.setupScene(deck)
/*:
Don't worry about the code here – this sets up the deck of cards that we'll be manipulating, and the scene that displays it.
*/

//: [Previous](@previous)

/*:
# Our First Sorting Algorithm: Bubble Sort!

For our first sorting algorithm, we're going to start with a simple algorithm called "__Bubble Sort__."

Before we start, we haven't yet said anything about how to retrieve information from the `Card` structs that inhabit our array. You can retrive the number `value` of a card, like so:

    let firstCard = cards[0]
    let value = firstCard.value

Similarly, you can retrieve the suite of a card, like this:

    let suite = firstCard.suite

We won't be dealing with suites just yet, though. Anyway, back to Bubble Sort...

The idea behind Bubble Sort is to repeatedly "bubble" up the larger elements towards the end of array, so that eventually the entire array will be sorted in ascending order. Sound like magic? Let's try it:

Let's say you look at the first two cards of the deck. You compare the two cards: does the first card have the higher value? _If_ so, we'll _swap_ those two cards, using the handy function we wrote earlier. Now those two cards should be in ascending order!

    let first = 0
    let second = 1
    if cards[first].value > cards[second].value {
        swap(first, second)
    }

Well, great. Now what about the rest of the cards? Worry not! We'll go ahead and do the same thing for the next pair of cards. And the next pair. And the next...until we reach the end of the array. Like so:

    for index in 0...(cards.count-2) {
        if (cards[index].value > cards[index+1].value {
            swap(index, index+1)
        }
    }

A note here: Why does the for loop go from 0 to cards.count-2? Remember that array indices go from `0` to `count-1`, and that we're inspecting pairs of `index` and `index+1`. If we iterate `index` from `0` to `count-1`, `index+1` would be outside the array bounds!

Go ahead and write this code in our new `bubblesort` function, provided below.

*/
extension Deck {
    func bubblesort() {
        //Student code here!
        for end in (cards.count-2).stride(to:1, by: -1) {
            for index in 0...end {
                if cards[index].value > cards[index+1].value {
                    swap(index, index+1)
                }
            }
        }
    }
}
deck.bubblesort()

/*:

Well, that didn't sort the deck completely. But you'll notice, that now the largest card has "bubbled" to the end of the array! If we do this multiple times, we'll get the next largest card to be at one before the end, the next next largest card to be two before the end, and so on. Note that when you go through this process the second time, you don't need to compare the last two cards, since the last card is already in place. This also holds true for the next iteration: in the third run, the last two cards are in place, and so on...

Can you modify our `bubblesort()` function and give it its complete implementation? Hint: It involves wrapping our existing code into _another_ for loop, and then modifying the variables that determine when the "bubbling" process ends.

*/

/*:
Congratulations, your array is now sorted! But perhaps you're not satisfied, because this sorting algorithm didn't seem very efficient. It sort of defied common sense too, since when you typically move the largest card to the end of the hand, you _scan_ through the pile looking for the largest value, instead of comparing each card against its neighbor and doing this bubbling process. We'll explore this room for improvmeent in the next section, where we will introduce a faster sorting algorithm, called Selection Sort. See you there!

*/


//: [Next](@next)














/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
sceneView.presentScene(scene);
XCPlaygroundPage.currentPage.liveView = sceneView;
