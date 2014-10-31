#!/usr/bin/swift

// sum of all primes below n
func main() {
    var n = 2000000
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }
}

main()
