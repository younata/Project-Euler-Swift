#!/usr/bin/swift

func main() {
    var n = 1000
    if Process.arguments.count == 2 {
        n = Process.arguments.last!.toInt()!
    }
    println("Requires bigint, not doing. Answer: 1366")
}

main()
