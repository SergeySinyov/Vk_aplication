//
//  SearchGroupTableViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 28.03.2022.
//

import UIKit

struct GroupedGroup {
    let charakter: Character
    var groups: [Group]
}

protocol SearchGroupTableViewControllerDelegate {
    func userUnsubscribe(group: Group)
    func userSubscribe(group: Group)
}

class SearchGroupTableViewController: UITableViewController {

    let allGroups = Group.allGroups
    var myGroups: [Group] = []

    var groupedGroups: [GroupedGroup] {
        var result = [GroupedGroup] ()

        for group in allGroups {
            guard let character = group.name.first else {
                continue
            }

            if let groupedIndex = result.firstIndex(where: { $0.charakter == character }) {
                result[groupedIndex].groups.append(group)
            } else {

                let groupedGroup = GroupedGroup(charakter: character, groups: [group])
                result.append(groupedGroup)
            }
        }

        return result
    }

    var delegate: SearchGroupTableViewControllerDelegate?

    override func numberOfSections(in tableView: UITableView) -> Int {
        return groupedGroups.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let groupedGroup = groupedGroups[section]
        return groupedGroup.groups.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let groupedGroup = groupedGroups[section]
        return String(groupedGroup.charakter)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellFilmsGroup",
                                                 for: indexPath) as? SearchGroupTableViewCell
        let groupedGroup = groupedGroups[indexPath.section]
        let group = groupedGroup.groups[indexPath.row]
        cell?.avatarFilms.image = UIImage(named: group.avatar)
        cell?.labelFilms.text = group.name
        return cell ?? UITableViewCell()

    }

    override func tableView(_ tableView: UITableView,
                            trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
    -> UISwipeActionsConfiguration? {

        let group = allGroups[indexPath.row]
        let isSubscribe = myGroups.contains { myGroup in
            return myGroup.id == group.id
        }

        let action: UIContextualAction
        if isSubscribe {

            action = UIContextualAction(style: .normal,
                                        title: "Отписаться",
                                        handler: { [weak self] _, _, complete  in
                guard let self = self else { return }

                self.myGroups.removeAll(where: { $0.id == group.id })
                self.delegate?.userUnsubscribe(group: group)
                complete(true)

            })

        } else {

            action = UIContextualAction(style: .normal,
                                        title: "Подписаться",
                                        handler: { [weak self] _, _, complete  in
                guard let self = self else { return }

                self.myGroups.append(group)
                self.delegate?.userSubscribe(group: group)
                complete(true)

            })
        }


        return UISwipeActionsConfiguration(actions: [action])
    }

}



















