//
//  FriendsTableViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 28.03.2022.
//

import UIKit

struct Friend {
    let name: String
    let avatar: String
    let photos: [String]
}


class FriendsTableViewController: UITableViewController {

    var friends: [Friend] = [
        Friend(name: "Sergey", avatar: "avatar", photos: ["photoOne", "photoTwo", "photoThree"]),
        Friend(name: "Andrey", avatar: "avatarTwo", photos: ["photoFour", "photoFive", "photoSix"]),
        Friend(name: "Elena", avatar: "avatarThree", photos: ["photoSeven", "photoEight", "photoNine"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as? FriendTableViewCell
        let friend = friends[indexPath.row]
        cell?.avatar.image = UIImage(named: friend.avatar)
        cell?.label.text = friend.name
        return cell ?? UITableViewCell()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? FriendTableViewCell,
              let index = tableView.indexPath(for: cell)?.row,
              let photoVC = segue.destination as? PhotoCollectionViewController else {
            return
        }

        let friend = friends[index]
        photoVC.friendsPhotos = friend.photos
    }
}


















