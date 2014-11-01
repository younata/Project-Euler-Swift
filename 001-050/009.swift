#!/usr/bin/swift

import Darwin

func sq(a: Int) -> Int {
    return a*a
}

func isPythagoreanTriplet(input: (a: Int, b: Int, c: Int)) -> Bool {
    let a = input.a
    let b = input.b
    let c = input.c
    return ((sq(a) + sq(b)) == sq(c)) && (a < b) && (b < c)
}

// pythagoreon triplets (a^2 + b^2 = c^2) such that a + b + c = n
func main() {
    var n = 1000
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }

    // a + b = n - c
    for a in 1..<998 {
        for b in a..<999 {
            let c = (n - (a + b))
            if sq(a) + sq(b) == sq(c) {
                println("\(a * b * c)")
                return
            }
        }
    }
    println("Not found")
}

main()
