#!/usr/bin/swift

import Darwin

class TriangleNumberGenerator : GeneratorType {
    typealias Element = Int

    var last = 0
    var lastIncrement = 0

    init() {
    }

    func next() -> Element? {
        lastIncrement++
        last += lastIncrement
        return last
    }
}

class TriangleNumbers: SequenceType {
    typealias Generator = TriangleNumberGenerator

    init() {
    }

    func generate() -> Generator {
        return TriangleNumberGenerator()
    }
}

func numFactors(n: Int) -> Int {
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    }
    var ret = 2
    let sqrtn = Int(ceil(sqrt(Double(n))))
    for i in 2 ..< sqrtn {
        if (n % i) == 0 {
            ret += 2
        }
    }
    return ret
}

func main() {
    var n = 500
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }
    for t in TriangleNumbers() {
        if numFactors(t) > n {
            println("\(t)")
            return
        }
    }
    println("not found")
}

main()
