import XCPlayground
let deck = Deck(comparator: nil, seed: false)
let (sceneView, scene) = CardSortScene.setupScene(deck)
/*:
 
 Don't worry about the code here – this sets up the deck of cards that we'll be manipulating, and the scene that displays it.
 ![Make School Banner](./swift_banner.png)
 # Swapping
 
 _Swapping_ two elements in an `Array` sounds pretty simple. You take the _element_ at the first index, the _element_ at the second index, and switch their places. Here, we've written out such a swap function for you, but its implementation is wrong. Can you find what's wrong and fix it?
 
 */
extension Deck {
/*:
     
 - note: Inside this class, the variable `cards` is an array of `Card` types. `Card` is a `struct` that we've defined ourselves, with two `Int` parameters -- `suit` and `value`.
     
    A _struct_ is a lot like a _class_. It can define it's own methods and properties but it cannot use inheritance. There are a few other differences that instructors can help you with but they are not important for this exercise!
 
 */

    public func swap(_ first: Int, _ second: Int) {
        // Fix this!
        //First, make copies of both cards
        let firstCard = cards[first]
        let secondCard = cards[second]
        //Then, assign each position in the Deck cards to the appropriate card
        cards[first] = secondCard
        cards[second] = firstCard
    }
    
/*:
     
 - callout(Hint): If it says _Copying_ in the preview then you did not do it right! You might need to create a new variable to store one of the values during the swap!
     
 */
}
/*:
 
 Now in order to test our swap function, we'll call it from the special `Deck` object that we've created for you. Simply call `deck.swap(x, y)` with two integers between 0 and 12 (since we have 13 cards in our array).
 
     deck.swap(0, 1)
 
 - important: Remember that array indices start go from 0 to _one less than_ the length of the array!
 
 */

deck.swap(4, 1)

/*
CANNOT IMPLEMENT CHALLENGE
 `random()` is deprecated and `arc4random()` cannot be seeded. The best alternative is using GameKit's random number generator, but doing so breaks the code with no explanation at all. I think it's a beta bug, but I'm not sure. I found one stack overflow post where this works, but they were on beta 1 or 2. I don't think this is a problem worth addressing until a more stable version of XCode 8 rolls out.
*/

/*:
 
 - callout(Challenge): The `Deck` _on this page_ will be the same every time you run the code. Can you get it sorted? Treat _Aces_ as `1`, _Jacks_ as `11`, _Queens_ as `12`, and _Kings_ as `13`. _Suit_ (or the symbol on the card) does not matter right now).
 
 Once the deck is sorted, hit the `Next` button to move on to the next section. We'll teach you _Bubblesort_, a foolproof sorting algorithm that uses the swap function!
 */
//: [Previous](@previous) | [Next](@next)
/*:
 Don't worry about this code. This takes the scene and deck information and displays it.
 */
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
