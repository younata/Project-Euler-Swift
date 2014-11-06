#!/usr/bin/swift

import Foundation

func charactersInNumber(n: Int, formatter: NSNumberFormatter) -> Int {
    let formatted : NSString = formatter.stringFromNumber(n)!
    let cset = NSCharacterSet(charactersInString: " -")
    let components : [String] = (formatted.componentsSeparatedByCharactersInSet(cset) as [String])
    let shouldContainAnd = n > 100 && (n % 100) != 0
    return countElements(join("", components)) + (shouldContainAnd ? 3 : 0)
}

func main() {
    var n = 1000
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }

    let formatter = NSNumberFormatter()
    formatter.numberStyle = .SpellOutStyle

    var ret = 0
    for i in 1...n {
        ret += charactersInNumber(i, formatter)
    }
    println("\(ret)")
}

main()
