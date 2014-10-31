#!/usr/bin/swift

func dividesBySeq(n: Int, maxN: Int) -> Int {
    for i in 1...maxN {
        if n % i != 0 {
            return i
        }
    }
    return maxN
}

func main() {
    var n = 20
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }

    var incrementor = 2520
    var ret = 2520
    var cm = 10
    while true {
        let m = dividesBySeq(ret, n)
        if m == n {
            break
        }
        if m > cm {
            incrementor = ret
            cm = m
        }
        ret += incrementor
    }
    println("\(ret)")
}

main()
