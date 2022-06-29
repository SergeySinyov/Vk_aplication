//
//  Friends.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 26.06.2022.
//

import Foundation


class Friends: Decodable {

    var items: [Friend] = []

    enum CodingKeys: String, CodingKey {
        case response
    }

    enum ResponceCodingKeys: String, CodingKey {
        case count
        case items
    }

    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy: ResponceCodingKeys.self, forKey: .response)
        let items = try response.decode([Friend].self, forKey: .items)
        self.items = items

    }









//
//    //    guard let url = URL(string: """
//    //https://api.vk.com/method/friends.get?id=8194946&fields=data,photo_100&display=mobile&access_token=vk1.a.PYOU6piHQJqQXz3PycTg8T7mrStks0rv0sn0Ef-eYbeRswaRkM7uJxoVB4oIafhcXIdXrOWEojka_vHd0Wt0RJZfBqWEwkf
//    //xphbJDmFuaJ2JaaaxSZeYuh00OiQHrKxS7UmdIQNDzbObf8rWyDG4RaDRsFmbJgDspPYxr_BqzVGtdHbzRiWK4WVqzfTKF31Y&v=5.131
//    //""") else {
//    //           return
//    //       }
//    //
//    //        URLSession.shared.dataTask(with: url) { data, response, error in
//    //
//    //            guard let data = data,
//    //                  let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) else {
//    //                return
//    //            }
//    //
//    //            let array = json as! [Any]
//    //            for userJason in array {
//    //                let userJason = userJason as! [String: Any]
//    //                let id = userJason ["id"] as! Int
//    //            }
//    //        }
}
