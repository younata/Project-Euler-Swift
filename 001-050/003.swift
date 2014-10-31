#!/usr/bin/swift

import Darwin

class FactorGenerator : GeneratorType {
    typealias Element = Int

    var n: Int

    var factors: [Int] = []

    init(number: Int) {
        n = number
    }

    func next() -> Element? {
        let startingPoint = factors.count == 0 ? 2 : factors.last!
        for i in startingPoint ... Int(sqrt(Double(n))) {
            if (n % i) == 0 && !contains(factors, i) {
                factors.append(i)
                return i
            }
        }
        return nil
    }
}

class Factors: SequenceType {
    typealias Generator = FactorGenerator

    let num: Int

    init(number: Int) {
        num = number
    }

    func generate() -> Generator {
        return FactorGenerator(number: num)
    }
}

func max(list: Factors) -> Int {
    var r = 0
    for i in list {
        if i > r {
            r = i
        }
    }
    return r
}

func isPrime(n: Int) -> Bool {
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func main() {
    var n = 600851475143
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }

    let primes = filter(Factors(number: n)) {return isPrime($0)}

    let ret = reduce(primes, 0) {(a: Int, b: Int) in
        if a < b {
            return b
        }
        return a
    }

    println("\(ret)")
}

main()
