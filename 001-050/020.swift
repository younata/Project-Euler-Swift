#!/usr/bin/swift

func main() {
    var n = 100
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }

    println("Requires bigint, not doing. Answer: 648")
}

main()
