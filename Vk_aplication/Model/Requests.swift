//
//  Requests.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 17.06.2022.
//

import UIKit
import Alamofire

class RequestsListFriend: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vkUrl = "https://api.vk.com"

        enum Request: String {
            case friends = "/method/friends.getLists"
//            case photos = "/method/photos.getAlbums"
//            case group = "/method/groups.get"

            var parametrs: [String: String] {
                switch self {
                case .friends:
                    return [
                        "id": "8194946",
                        "fields": "name, photo_100",
                        "access_token": Session.instance.token,
                        "v": "5.131"
                    ]
//                case .photos:
//                    return [
//                        "id": "8194946",
//                        "fields": "name, photo_100",
//                        "access_token": Session.instance.token,
//                        "v": "5.131"
//                    ]
//                case .group:
//                    return [
//                        "id": "8194946",
//                        "fields": "name, photo_100",
//                        "access_token": Session.instance.token,
//                        "v": "5.131"
//                    ]
                }
            }
        }

        func loadData(method: Request, completion: @escaping (Data?) -> Void ) {
            let path = method.rawValue
            let parameters: Parameters = method.parametrs
            let url = vkUrl + path
            print(url)

            AF.request(url, method: .get, parameters: parameters).responseData { response in
                guard let data = response.value else {
                    print("no data")
                    completion(nil)
                    return
                }
                completion(data)
            }
        }

        func loadFriends(completion: @escaping ([Friend]) -> Void) {
            loadData(method: .friends) { data in
                guard let data = data,
                      let friendsResponse = try? JSONDecoder().decode(Friends.self, from: data)
                else {
                    completion([])
                    return
                }
                completion(friendsResponse.items)
            }
        }
    }
}






        //        let configurate = URLSessionConfiguration.default
        //        let session = URLSession(configuration: configurate)
        //
        //        var urlComponents = URLComponents()
        //        urlComponents.scheme = "https"
        //        urlComponents.host = "api.vk.com"
        //        urlComponents.path = "/method/friends.getLists"
        //        urlComponents.queryItems = [
        //            URLQueryItem(name: "user_id", value: "8194946"),
        //            URLQueryItem(name: "display", value: "mobile"),
        //            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        //            URLQueryItem(name: "scope", value: "262150"),
        //            URLQueryItem(name: "response_type", value: Session.instance.token),
        //            URLQueryItem(name: "v", value: "5.131")
        //        ]
        //
        //        guard let url = urlComponents.url else { return }
        //
        //        let task = session.dataTask(with: url) { ( data, respone, error) in
        //            let json = try? JSONSerialization.jsonObject(with: data!,
        //                                                         options: JSONSerialization.ReadingOptions.allowFragments)
        //            print(json ?? "not json")
        //        }
        //
        //        task.resume()
        //
        //    }
        //
        //}
        //
        //class RequestPhotoUsers: UIViewController {
        //
        //    override func viewDidLoad() {
        //        super.viewDidLoad()
        //
        //        let configurate = URLSessionConfiguration.default
        //        let session = URLSession(configuration: configurate)
        //
        //        var urlComponents = URLComponents()
        //        urlComponents.scheme = "https"
        //        urlComponents.host = "api.vk.com"
        //        urlComponents.path = "/method/photos.getAlbums"
        //        urlComponents.queryItems = [
        //            URLQueryItem(name: "user_id", value: "8194946"),
        //            URLQueryItem(name: "display", value: "mobile"),
        //            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        //            URLQueryItem(name: "scope", value: "262150"),
        //            URLQueryItem(name: "response_type", value: Session.instance.token),
        //            URLQueryItem(name: "v", value: "5.131")
        //        ]
        //
        //        guard let url = urlComponents.url else { return }
        //
        //        let task = session.dataTask(with: url) { ( data, respone, error) in
        //            let json = try? JSONSerialization.jsonObject(with: data!,
        //                                                         options: JSONSerialization.ReadingOptions.allowFragments)
        //            print(json ?? "not json")
        //        }
        //
        //        task.resume()
        //
        //    }
        //
        //}
        //
        //class RequestGroupsUsers: UIViewController {
        //
        //    override func viewDidLoad() {
        //        super.viewDidLoad()
        //
        //        let configurate = URLSessionConfiguration.default
        //        let session = URLSession(configuration: configurate)
        //
        //        var urlComponents = URLComponents()
        //        urlComponents.scheme = "https"
        //        urlComponents.host = "api.vk.com"
        //        urlComponents.path = "/method/groups.get"
        //        urlComponents.queryItems = [
        //            URLQueryItem(name: "user_id", value: "8194946"),
        //            URLQueryItem(name: "display", value: "mobile"),
        //            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        //            URLQueryItem(name: "scope", value: "262150"),
        //            URLQueryItem(name: "response_type", value: Session.instance.token),
        //            URLQueryItem(name: "v", value: "5.131")
        //        ]
        //
        //        guard let url = urlComponents.url else { return }
        //
        //        let task = session.dataTask(with: url) { ( data, respone, error) in
        //            let json = try? JSONSerialization.jsonObject(with: data!,
        //                                                         options: JSONSerialization.ReadingOptions.allowFragments)
        //            print(json ?? "not json")
        //        }
        //
        //        task.resume()
        //
        //    }
        //
        //}
        //
        //class RequestSearchGroupsUsers: UIViewController {
        //
        //    override func viewDidLoad() {
        //        super.viewDidLoad()
        //
        //        let configurate = URLSessionConfiguration.default
        //        let session = URLSession(configuration: configurate)
        //
        //        var urlComponents = URLComponents()
        //        urlComponents.scheme = "https"
        //        urlComponents.host = "api.vk.com"
        //        urlComponents.path = "/method/groups.search"
        //        urlComponents.queryItems = [
        //            URLQueryItem(name: "user_id", value: "8194946"),
        //            URLQueryItem(name: "display", value: "mobile"),
        //            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        //            URLQueryItem(name: "scope", value: "262150"),
        //            URLQueryItem(name: "response_type", value: Session.instance.token),
        //            URLQueryItem(name: "v", value: "5.131")
        //        ]
        //
        //        guard let url = urlComponents.url else { return }
        //
        //        let task = session.dataTask(with: url) { ( data, respone, error) in
        //            let json = try? JSONSerialization.jsonObject(with: data!,
        //                                                         options: JSONSerialization.ReadingOptions.allowFragments)
        //            print(json ?? "not json")
        //        }
        //
        //        task.resume()
        //
        //    }

//    }

