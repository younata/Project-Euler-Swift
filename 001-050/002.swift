#!/usr/bin/swift

class FibonacciGenerator : GeneratorType {
    typealias Element = Int

    var generated: [Element] = []

    var max = Int.max

    convenience init() {
        self.init(max: Int.max)
    }

    init(max: Int) {
        self.max = max
        generated = [0, 1]
    }

    func next() -> Element? {
        let n = generated.last!
        let m = generated[generated.count - 2]
        let r = n + m
        if r > max {
            return nil
        }
        generated.append(r)
        return r
    }
}

class Fibonacci : SequenceType {
    typealias Generator = FibonacciGenerator

    var max = Int.max

    convenience init() {
        self.init(max: Int.max)
    }

    init(max: Int) {
        self.max = max
    }

    func generate() -> Generator {
        return FibonacciGenerator(max: max)
    }
}

func main() {
    var max = 4000000
    if Process.arguments.count == 2 {
        max = Process.arguments.last!.toInt()!
    }
    let seq = Fibonacci(max: max)
    let ret = reduce(filter(seq) {return $0 % 2 == 0}, 0) {
        return $0 + $1
    }
    println("\(ret)")
}

main()
