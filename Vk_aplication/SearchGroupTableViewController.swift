//
//  SearchGroupTableViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 28.03.2022.
//

import UIKit

protocol SearchGroupTableViewControllerDelegate {
    func userUnsubscribe(group: Group)
    func userSubscribe(group: Group)
}

class SearchGroupTableViewController: UITableViewController {

    let allGroups = Group.allGroups
    var myGroups: [Group] = []

    var delegate: SearchGroupTableViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellFilmsGroup", for: indexPath) as? SearchGroupTableViewCell
        let group = allGroups[indexPath.row]
        cell?.avatarFilms.image = UIImage(named: group.avatar)
        cell?.labelFilms.text = group.name
        return cell ?? UITableViewCell()

    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let group = allGroups[indexPath.row]
        let isSubscribe = myGroups.contains { myGroup in
            return myGroup.id == group.id
        }

        let action: UIContextualAction
        if isSubscribe {

            action = UIContextualAction(style: .normal, title: "Отписаться", handler: { [weak self] _, _, complete  in
                guard let self = self else { return }

                self.myGroups.removeAll(where: { $0.id == group.id })
                self.delegate?.userUnsubscribe(group: group)
                complete(true)

            })

        } else {

            action = UIContextualAction(style: .normal, title: "Подписаться", handler: { [weak self] _, _, complete  in
                guard let self = self else { return }

                self.myGroups.append(group)
                self.delegate?.userSubscribe(group: group)
                complete(true)

            })
        }


        return UISwipeActionsConfiguration(actions: [action])
    }

}



















