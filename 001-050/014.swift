#!/usr/bin/swift

class CollatzGenerator : GeneratorType {
    typealias Element = Int

    var last: Int

    init(number: Int) {
        last = number
    }

    func next() -> Element? {
        if last == 1 {
            return nil
        }
        if (last % 2) == 0 { // even
            last /= 2
        } else {
            last = 3 * last + 1
        }
        return last
    }
}

class Collatz: SequenceType {
    typealias Generator = CollatzGenerator

    let num: Int

    init(number: Int) {
        num = number
    }

    func generate() -> Generator {
        return CollatzGenerator(number: num)
    }
}

func countSeq(seq: Collatz) -> Int {
    var ret = 0
    for i in seq {
        ret++
    }
    return ret
}

func main() {
    var n = 1000000
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }

    var m = 0
    var num = 0

    for i in 3..<n {
        let r = countSeq(Collatz(number: i))
        if r > m {
            m = r
            num = i
        }
    }
    println("\(m), \(num)")
}

main()
