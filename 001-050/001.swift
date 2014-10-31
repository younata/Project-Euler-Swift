#!/usr/bin/swift

func divides(a: Int, b: Int) -> Bool {
    return (a % b) == 0
}

func main() {
    let args = Process.arguments
    var max : Int = 1000
    if args.count == 2 {
        max = args.last!.toInt()!
    }
    var ret = 0
    for i in 0 ..< max {
        if divides(i, 3) || divides(i, 5) {
            ret += i
        }
    }
    println("\(ret)")
}

main()
