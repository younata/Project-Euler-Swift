#!/usr/bin/swift

import Foundation

func isPalindrome(p: Int) -> Bool {
    let stringify = (String(p) as NSString)
    let l = stringify.length
    for i in 0...(l / 2) {
        if stringify.characterAtIndex(i) != stringify.characterAtIndex(l - (1 + i)) {
            return false
        }
    }
    return true
}

func pow10(n: Int) -> Double {
    return pow(10.0, Double(n))
}

func main() {
    var n = 2
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()! - 1
    }

    var palindromes : [Int] = []

    for x in Int(pow10(n))..<Int(pow10(n+1)) {
        for y in Int(pow10(n))..<Int(pow10(n+1)) {
            let m = x * y
            if isPalindrome(m) {
                palindromes.append(m)
                //println(m)
            }
        }
    }
    let ret = maxElement(palindromes)

    println("\(ret)")
}

main()
