import XCPlayground
let deck = Deck()
let (sceneView, scene) = CardSortScene.setupScene(deck)
/*:
Don't worry about the code here – this sets up the deck of cards that we'll be manipulating, and the scene that displays it.
*/

//: [Previous](@previous)

/*:

# A faster sorting algorithm: Selection Sort

Selection sort is perhaps what you first think of when sorting an array. It works as follows:

1. Find the lowest value in the array. Keep track of which index that card resides at.
2. Swap the lowest card with the first card.
3. Repeat, by finding the lowest card in the rest of the array. On step #2, swap with the first card in the unsorted section.

Let's start by finding the lowest value card: We have a for loop, which goes through all the cards, and a variable declared _outside_ the for loop, which keeps track of the index to the lowest card. If we find a card that's lower than the one lowestIndex points to, we update lowestIndex to the new index. After everything is over, we swap `lowestIndex` with 0, the first element.

    var lowestIndex = 0
    for index in 1...cards.count-1 {
        if cards[index].value < cards[lowestIndex].value {
            lowestIndex = index
        }
    }
    swap(lowestIndex, 0)

Cool! Now repeat this as many times as there are cards in the array, making sure to do the swap with the index the points to the first position in the _unsorted_ area of the array. Can you figure out the rest of the implementation?
*/

extension Deck {
    func selectionsort() {
        //Student code here!
        // TODO: Remove code
        for count in 0...cards.count-2 {
            var lowestIndex = count
            for index in count+1...cards.count-1 {
                if cards[index].value < cards[lowestIndex].value {
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
