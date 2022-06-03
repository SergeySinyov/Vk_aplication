//
//  FriendsTableViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 28.03.2022.
//

import UIKit

struct Friend {
    let userId: UUID = .init()
    let name: String
    let avatar: String
    let photos: [String]
}

struct FriendedFriend {
    let charakter: Character
    var friends: [Friend]
}


class FriendsTableViewController: UITableViewController {

    var friends: [Friend] = [
        Friend(name: "Синёв Сергей", avatar: "avatar", photos: ["photoOne", "photoTwo", "photoThree"]),
        Friend(name: "Андреев Николай", avatar: "avatarTwo", photos: ["photoFour", "photoFive", "photoSix"]),
        Friend(name: "Ефремова Елена", avatar: "avatarThree", photos: ["photoSeven", "photoEight", "photoNine"]),
        Friend(name: "Голубева Юлия", avatar: "avatarFour", photos: ["photoTen", "photoEleven", "photoTwelve"]),
        Friend(name: "Ковалёв Данил", avatar: "avatarFive", photos: ["photoThirteen", "photoFourteen", "photoFiveteen"]),
        Friend(name: "Морева Мария", avatar: "avatarSix", photos: ["photoSixteen", "photoSeventeen", "photoEighteen"]),
        Friend(name: "Гаврилов Николай", avatar: "avatarSeven", photos: ["photoNineteen", "photoTwenty", "photoTwentyOne"]),
        Friend(name: "Шварц Томас", avatar: "avatarEight", photos: ["photoTwentyTwo", "photoTwentyThree", "photoTwentyFour"]),
        Friend(name: "Джобс Стив", avatar: "avatarNine", photos: ["photoTwentyFive", "photoTwentySix", "photoTwentySeven"]),
        Friend(name: "Цукерберк Марк", avatar: "avatarTen", photos: ["photoTwentyEight", "photoTwentyNine", "photoThirty"])
    ]

    var friendedFriends: [FriendedFriend] {
        var result = [FriendedFriend] ()

        for friend in friends {
            guard let charakter = friend.name.first else {
                continue
            }

            if let friendIndex = result.firstIndex(where: { $0.charakter == charakter }) {
                result[friendIndex].friends.append(friend)
            } else {

                let friendedFriend = FriendedFriend(charakter: charakter, friends: [friend])
                result.append(friendedFriend)
            }
        }

        return result

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendedFriends.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        let friendedFriend = friendedFriends[section]
        return friendedFriends[section].friends.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //        let friendedFriend = friendedFriends[section]
        return String(friendedFriends[section].charakter)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath) as? FriendTableViewCell
        let friendedFriend = friendedFriends[indexPath.section]
        let friend = friendedFriend.friends[indexPath.row]

        cell?.avatar.image = UIImage(named: friend.avatar)
        cell?.label.text = friend.name

        return cell ?? UITableViewCell()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let cell = sender as? FriendTableViewCell,
            let index = tableView.indexPath(for: cell)?.section,
            let photoVC = segue.destination as? PhotoCollectionViewController
        else {
            return
        }

        //Push navigationController
//        navigationController?.pushViewController(photoVC, animated: true)

        let friend = friends[index]
        photoVC.friendsPhotos = friend.photos
    }
}



















