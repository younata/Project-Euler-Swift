#!/usr/bin/swift

import Darwin

class PrimeGenerator : GeneratorType {
    typealias Element = Int

    var primes: [Int] = []

    init() {
    }

    func next() -> Element? {
        var n = primes.count == 0 ? 2 : (primes.last! + 2)
        if n == 4 {
            n = 3
        }
        while true {
            var passed = true
            let sqrn = Int(ceil(sqrt(Double(n))))
            for p in primes {
                if (p > sqrn) {
                    break
                }
                if n % p == 0 {
                    passed = false
                    break
                }
            }
            if passed {
                primes.append(n)
                return n
            }
            if (n == 2) {
                n++
            } else {
                n += 2
            }
        }
    }
}

class Primes: SequenceType {
    typealias Generator = PrimeGenerator

    init() {
    }

    func generate() -> Generator {
        return PrimeGenerator()
    }
}

// sum of all primes below n
func main() {
    var n = 2000000
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }

    var ret = 0
    for i in Primes() {
        if i > n {
            break
        }
        ret += i
    }
    println("\n\(ret)")
}

main()
