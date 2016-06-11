import XCPlayground
let deck = Deck(comparator: suiteFirstComparator)
let (sceneView, scene) = CardSortScene.setupScene(deck)
/*:
Don't worry about the code here – this sets up the deck of cards that we'll be manipulating, and the scene that displays it.
*/

//: [Previous](@previous)

/*:

# Custom Comparators: Sorting by arbitrary properties

So far we've only been sorting using the `value` property of the `Card` struct. But that's typically not how a fresh pack of cards is sorted by – it's typically sorted by suite order, then by value. This is what we'll be trying to do now – but we'll do it in such a way that separates the logic for how we compare cards, from the logic that sorts the cards. Read on...

Here, we've given you a complete implementation of selection sort, but different in that it simply uses the `<` operator to compare two cards together. This typically wouldn't be legal Swift code, since the Card type is a struct and there isn't an inherent way to compare the value of two structs together – but, Swift also allows you to implement custom operators by way of writing functions for them. So here, we define a `<` function that takes in two Cards as parameters, and lo and behold, you can compare cards using `<`.

Right now, the `<` function always returns `false`, which isn't what we want. Can you modify the operator function so that it returns a true _if_ the left card should be sorted before the right card, based on suite order, then by rank?

Note: You can retrieve the integer value of a suite with `card.suite.rawValue`. The values for these will be between 0 and 3, in ascending suite order. Also we've given you a handy constant – `numCardsInSuite` that gives you the number of cards in each suite, 13. Use this when writing your maths ;)

*/
let numCardsInSuite = 13

public func <(first: Card, second: Card) -> Bool {
    // Student code here!
    // TODO: replace with dummy code instead of solution
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
