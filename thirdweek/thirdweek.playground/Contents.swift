//: Playground - noun: a place where people can play

import UIKit

import Foundation
func getDate(date: Date, zone: Int = 0) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy年MM月dd日EEEE aa KK:mm"
    formatter.locale = Locale(identifier: "zh_CN")
    if zone >= 0 {
        formatter.timeZone = TimeZone(abbreviation: "UTC+\(zone):00")
    } else {
        formatter.timeZone = TimeZone(abbreviation: "UTC\(zone):00")
    }
    
    let dateString = formatter.string(from: now)
    return dateString
}

let now = Date()

let beijing = getDate(date: now, zone: +8)
print("北京: \(beijing)")

let tokyo = getDate(date: now, zone: 9)
print("东京: \(tokyo)")

let newYork = getDate(date: now, zone: -5)
print("纽约: \(newYork)")

let london = getDate(date: now)
print("伦敦: \(london)")


let parentString = "Swift is a powerful and intuitive programming language for iOS, OS X, tvOS, and watchOS."
let subString = parentString.replacingOccurrences(of: "OS", with: "")
print(subString)


let dic = ["date": ["beijing": beijing, "tokyo": tokyo, "newYork": newYork, "london": london], "string": subString] as AnyObject

let defaultDoc = FileManager.default
if var path = defaultDoc.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
    path.append("/test.txt")
    
    print(dic.write(toFile: path, atomically: true))
}


// MARK: question4
let image = try Data(contentsOf: URL(string: "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png")!)

if var url = defaultDoc.urls(for: .documentDirectory, in: .userDomainMask).first {
    url.appendPathComponent("image.png")
    try image.write(to: url)
}



let url = URL(string: "http://www.weather.com.cn/data/sk/101110102.html")!
let data = try Data(contentsOf: url)
let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)


if let dic = json as? [String: Any] {
    if let weather = dic["weatherinfo"] as? [String: Any] {
        let city = weather["city"]!
        let temp = weather["temp"]!
        let wd = weather["WD"]!
        let ws = weather["WS"]!
        print("城市: \(city), 温度: \(temp), 风向: \(wd), 风力: \(ws)")
    }
}

