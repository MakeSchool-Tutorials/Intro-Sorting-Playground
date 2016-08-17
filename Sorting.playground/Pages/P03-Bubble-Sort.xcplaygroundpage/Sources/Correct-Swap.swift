extension Deck {
    public func swap(_ first: Int, _ second: Int) {
        let temp = cards[first]
        cards[first] = cards[second]
        cards[second] = temp
    }
}
