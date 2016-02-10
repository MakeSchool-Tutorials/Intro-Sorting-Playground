import XCPlayground
let deck = Deck()
let (sceneView, scene) = CardSortScene.setupScene(deck)
/*:
Don't worry about the code here – this sets up the deck of cards that we'll be manipulating, and the scene that displays it.
*/

//: [Previous](@previous)


/*:
## Swapping

_Swapping_ two elements in an array sounds pretty simple: You take the element at the first chosen index in the array, and the element at the second chosen index, and assign them to eachothers' places. In fact, it's so simple that we've written it out for you! Here we've written a `swap` function in the `Deck` class (don't worry about this), so that you can swap the cards of a deck.

*/
extension Deck {
/*:
Inside this class, the variable `cards` is an array of `Card` types (`Card` is a struct that we've defined ourselves, with two Int parameters, `suite` and `value`). You can access elements of this variable to manipulate the order of the cards.
*/
    public func swap(first: Int, _ second: Int) {
        
        // Student code here!
        cards[first] = cards[second]
        cards[second] = cards[first]
    }
}

/*:

Now in order to test our swap function, we'll call it from the special `Deck` object that we've made for you. Simply call `deck.swap(x, y)`, passing in two integers between 0 and 12 (since we have 13 cards in our array), like so:

    deck.swap(0, 1)

Remember that array indices start go from 0 to _one less than_ the length of the array!
*/

// Student code here!
deck.swap(1, 3)


/*:
### This doesn't swap the cards! You've lied to me!
What happened?! The card from the second index seems to have _copied_ itself to the card at the first index! That's not what we wanted. It seems like there's something wrong with the swap function that we provided. Can you find what's wrong and fix it?

Once you've fixed the problem, hit the Next button to move on to the next section, where we'll be writing our first sorting algorithm using the swap function!
*/

//: [Next](@next)














/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
sceneView.presentScene(scene);
XCPlaygroundPage.currentPage.liveView = sceneView;

