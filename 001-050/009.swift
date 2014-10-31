#!/usr/bin/swift

// pythagoreon triplets (a^2 + b^2 = c^2) such that a + b + c = n
func main() {
    var n = 1000
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }
}

main()
