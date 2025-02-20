import XCTest

class LinkedListTests: XCTestCase {
    func test_빈_LinkedList의_head는_nil이다() {
        let linkedList = LinkedList<Double>(head: nil)
        XCTAssertNil(linkedList.head)
    }
    
    func test_1과2와3과4가_있는_LinkedList의_head의_value는_1이다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4)))))
        XCTAssertEqual(linkedList.head?.value, 1)
    }
    
    func test_빈_LinkedList의_tail은_nil이다() {
        let linkedList = LinkedList<Double>(head: nil)
        XCTAssertNil(linkedList.tail)
    }
    
    func test_1과2와3과4가_있는_LinkedList의_tail의_value는_3이다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4)))))
        XCTAssertEqual(linkedList.tail?.value, 4)
    }
    
    func test_빈_LinkedList의_isEmpty는_true이다() {
        let linkedList = LinkedList<Double>(head: nil)
        XCTAssertTrue(linkedList.isEmpty)
    }
    
    func test_1이_있는_LinkedList의_isEmpty는_false이다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1))
        linkedList.append(value: 2)
        XCTAssertFalse(linkedList.isEmpty)
    }
    
    func test_빈_LinkedList에_1을_append하면_1이_남는다() {
        let linkedList = LinkedList<Double>(head: nil)
        linkedList.append(value: 1)
        XCTAssertEqual(linkedList.scanAllValues(), [1])
    }
    
    func test_1이_있는_LinkedList에_2를_append하면_1과2가_남는다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1, next: Node(value: 2)))
        XCTAssertEqual(linkedList.scanAllValues(), [1, 2])
    }
    
    func test_빈_LinkedList를_removeFirst하면_빈_LinkedList가되고_nil을_반환한다() {
        let linkedList = LinkedList<Double>(head: nil)
        let removedValue = linkedList.removeFirst()
        XCTAssertTrue(linkedList.scanAllValues().isEmpty)
        XCTAssertEqual(removedValue, nil)
    }
    
    func test_1이_있는_LinkedList를_removeFirst하면_빈_LinkedList가되고_제거한값을_반환한다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1))
        let removedValue = linkedList.removeFirst()
        XCTAssertTrue(linkedList.scanAllValues().isEmpty)
        XCTAssertEqual(removedValue, 1)
    }

    func test_1과2가_있는_LinkedList를_removeFirst하면_2가_남고_제거한값1을_반환한다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1, next: Node(value: 2)))
        let removedValue = linkedList.removeFirst()
        XCTAssertEqual(linkedList.scanAllValues(), [2])
        XCTAssertEqual(removedValue, 1)
    }
    
    func test_1과2와3이_있는_LinkedList를_removeFirst하면_2와3이_남고_제거한값1을_반환한다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1, next: Node(value: 2, next: Node(value: 3))))
        let removedValue = linkedList.removeFirst()
        XCTAssertEqual(linkedList.scanAllValues(), [2, 3])
        XCTAssertEqual(removedValue, 1)
    }

    func test_빈_LinkedList를_scanAllValues하면_빈_배열을_반환한다() {
        let linkedList = LinkedList<Double>(head: nil)
        XCTAssertEqual(linkedList.scanAllValues(), [])
    }

    func test_1이_있는_LinkedList를_scanAllValues하면_1을_배열에_담아_반환한다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1))
        XCTAssertEqual(linkedList.scanAllValues(), [1])
    }
    
    func test_1과2가_있는_LinkedList를_scanAllValues하면_1과2를_배열에_담아_반환한다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1, next: Node(value: 2)))
        XCTAssertEqual(linkedList.scanAllValues(), [1, 2])
    }
    
    func test_1과2와3과4가_있는_LinkedList를_scanAllValues하면_1과2와3과4를_배열에_담아_반환한다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1, next: Node(value: 2, next: Node(value: 3, next: Node(value: 4)))))
        XCTAssertEqual(linkedList.scanAllValues(), [1, 2, 3, 4])
    }
    
    func test_1과2가_있는_LinkedList를_removeAll하면_빈_LinkedList가된다() {
        let linkedList = LinkedList<Double>(head: Node(value: 1, next: Node(value: 2)))
        linkedList.removeAll()
        XCTAssertNil(linkedList.head)
    }
}
