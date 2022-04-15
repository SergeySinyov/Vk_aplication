//
//  GroupTableViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 28.03.2022.
//

import UIKit


class MyGroupTableViewController: UITableViewController {

    var myGroups: [Group] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstGroup = Group.allGroups.first {
            myGroups.append(firstGroup)
        }

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellFootballGroup", for: indexPath) as? GroupTableViewCell
        let group = myGroups[indexPath.row]
        cell?.avatarGroupFootball.image = UIImage(named: group.avatar)
        cell?.labelFootbal.text = group.name
        return cell ?? UITableViewCell()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let allGroupsVC = segue.destination as? SearchGroupTableViewController {
            allGroupsVC.myGroups = myGroups
            allGroupsVC.delegate = self

        }
    }
}


extension MyGroupTableViewController: SearchGroupTableViewControllerDelegate {
    func userUnsubscribe(group: Group) {
        myGroups.removeAll(where:  { $0.id == group.id } )
        tableView.reloadData()
    }
    
    func userSubscribe(group: Group) {
        myGroups.append(group)
        tableView.reloadData()
    }

}
