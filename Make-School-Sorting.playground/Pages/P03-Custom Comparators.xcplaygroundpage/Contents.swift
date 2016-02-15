import XCPlayground
let deck = Deck()
let (sceneView, scene) = CardSortScene.setupScene(deck)
/*:
Don't worry about the code here – this sets up the deck of cards that we'll be manipulating, and the scene that displays it.
*/

//: [Previous](@previous)

/*:

# Custom Comparators: Sorting by arbitrary properties

So far we've only been sorting using the `value` property of the `Card` struct. But that's typically not how a fresh pack of cards is sorted by – it's typically sorted by suite order, then by value.

*/
let numCardsInSuite = 13

public func <(first: Card, second: Card) -> Bool {
    return first.suite.rawValue * numCardsInSuite + first.value < second.suite.rawValue * numCardsInSuite + second.value
}

extension Deck {
    public func selectionsort() {
        for count in 0...cards.count-2 {
            var lowestIndex = count
            for index in count+1...cards.count-1 {
                if cards[index] < cards[lowestIndex] {
                    lowestIndex = index
                }
            }
            swap(lowestIndex, count)
        }
    }
}

deck.selectionsort()

//: [Next](@next)














/*:
Don't worry about this code. This takes the scene and deck information and displays it.
*/
sceneView.presentScene(scene);
XCPlaygroundPage.currentPage.liveView = sceneView;
