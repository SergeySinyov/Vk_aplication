//
//  SearchGroupTableViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 28.03.2022.
//

import UIKit

class SearchGroupTableViewController: UITableViewController {

    let searchGroups: [Group] = [
        Group(name: "Films", avatar: "groupFilms"),
        Group(name: "Fasion", avatar: "groupFasion"),
        Group(name: "WebDesing", avatar: "groupWebDesign")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellFilmsGroup", for: indexPath) as? SearchGroupTableViewCell
        let group = searchGroups[indexPath.row]
        cell?.avatarFilms.image = UIImage(named: group.avatar)
        cell?.labelFilms.text = group.name
        return cell ?? UITableViewCell()

    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [UIContextualAction(style: .normal, title: "Удалить", handler:
            { _, _, block in

            block(true)
        })])
    }

}



















