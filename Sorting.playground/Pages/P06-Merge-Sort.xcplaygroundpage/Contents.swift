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
//Pseudocode
//mergeSort(list){
//base case:
//if list.count <= 1
//return, because a single element must be sorted
//else
//split list into two separate lists
//sort the two lists
//merge the two lists
//return that merged list

//Real code
let numCardsInSuit = 13

public func <(first: Card, second: Card) -> Bool {
    // Implement this!
    return first.suit.rawValue * numCardsInSuit + first.value < second.suit.rawValue * numCardsInSuit + second.value
}

<!-- TODO: I think we should at least give them the option of doing this on their own here. Yes, the pseudocode and then running through the algo should be a challenge, but the `Crazy challenge` would be to code it. I also think they should be given the tools to do so (I had to copy and paste the above code such that mine would work). Even if they can't right away, this could be something they think about when they're going about their day away from computer - obsessing over how to code it. I think it could inspire some people to really dive into the problem and discover recursion on their own along the way. --!>

extension Deck{

    func merge_sort(){
        cards = merge_sort(inputCards: cards)
    }

    private func merge_sort(inputCards: [Card]) -> [Card]{
        let sortMe = inputCards

        //Base case
        if sortMe.count <= 1{
            return sortMe
        }
        var left = [Card]()
        var right = [Card]()
        for index in 0..<sortMe.count{
            index % 2 == 0 ? left.append(sortMe[index]) : right.append(sortMe[index])
        }
        let sortedLeft = merge_sort(inputCards: left)
        let sortedRight = merge_sort(inputCards: right)
        return merge(sortedLeft, sortedRight)

    }

    private func merge(_ left:[Card],_ right:[Card]) -> [Card]{
        var mergedCards = [Card]()
        var mutableLeft = left
        var mutableRight = right
        while (mutableLeft.count + mutableRight.count > 0){
            guard let leftCard = mutableLeft.first else {
                //if the left stack is empty, add the first card of the right stack
                mergedCards.append(mutableRight.removeFirst())
                continue
            }
            guard let rightCard = mutableRight.first else {
                //if the right stack is empty, add the first card of the left stack
                mergedCards.append(mutableLeft.removeFirst())
                continue
            }
            mergedCards.append((leftCard < rightCard) ? mutableLeft.removeFirst() : mutableRight.removeFirst())
        }
        return mergedCards
    }
}

<!-- TODO: Add an additional wrap-up section where runtime complexity is either explained in broad strokes or we link them to another tutorial... something they can look into on their own, maybe? I admit it'll be hard to talk run time with beginners on merge sort. --!>

import XCPlayground
let deck = Deck(comparator: suitFirstComparator)
let (sceneView, scene) = CardSortScene.setupScene(deck)
sceneView.presentScene(scene)
XCPlaygroundPage.currentPage.liveView = sceneView
deck.merge_sort()
deck.isSorted()


//: [Previous](@previous)
