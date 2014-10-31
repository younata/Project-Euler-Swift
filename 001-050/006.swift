#!/usr/bin/swift

func sumSquares(n: Int) -> Int {
    let r = 0...n
    return reduce(0...n, 0) {return $0 + ($1 * $1)}
}

func squareSums(n: Int) -> Int {
    let d = reduce(0...n, 0) {return $0 + $1}
    return d * d
}

func main() {
    var n = 100
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }

    println("\(squareSums(n) - sumSquares(n))")
}

main()
