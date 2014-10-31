#!/usr/bin/swift

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
            for p in primes {
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

func main() {
    var n = 10001
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }

    // fuck you, this takes ~3 minutes on my (mid 2012 macbook pro) machine.

    for (i, x) in enumerate(Primes()) {
        if (i + 1) == n {
            println("\(x)")
            return
        }
    }
}

main()
