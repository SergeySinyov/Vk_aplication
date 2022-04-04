//
//  GroupTableViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 28.03.2022.
//

import UIKit

struct Group {
    let name: String
    let avatar: String
}


class GroupTableViewController: UITableViewController {

    let groups: [Group] = [
        Group(name: "Footbal", avatar: "groupFootball"),
        Group(name: "News", avatar: "groupNews"),
        Group(name: "Cars", avatar: "groupCar")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellFootballGroup", for: indexPath) as? GroupTableViewCell
        let group = groups[indexPath.row]
        cell?.avatarGroupFootball.image = UIImage(named: group.avatar)
        cell?.labelFootbal.text = group.name
        return cell ?? UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [UIContextualAction(style: .normal, title: "Удалить", handler:
            { _, _, block in

            block(true)
        })])
    }
}
