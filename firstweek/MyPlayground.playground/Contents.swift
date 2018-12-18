//: Playground - noun: a place where people can play

import UIKit

var primes = [Int]()
for i in 2...10000{
    var isPrime = true
    for j in 2..<i {
        if i % j == 0
        {
            isPrime = false
        }
    }
    if isPrime{
        primes.append(i)
    }
}

print(primes)
primes.reverse()
//print(primes)
//primes.sorted()
//
//func compare(x:Int,y:Int)->Bool{
//    return x > y
//}
//primes.sort(by: compare)
//
//primes.sort(by:{
//    (x:Int,y:Int) -> Bool in
//    return x > y
//})
//
//primes.sort(by:{
//    (x,y)  in
//    return x > y
//})
//
//primes.sort(by:{
//    (x,y)  in
//    x > y
//})
//
//primes.sort(by: { $0 > $1 })
//
//primes.sort{ $0 > $1}
//
//primes.sort(by: >)

