//
//  GroupTableViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 28.03.2022.
//

import UIKit


class MyGroupTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var myGroups: [Group] = []
    var searhGroups: [Group] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if let firstGroup = Group.allGroups.first {
            myGroups.append(firstGroup)
        }

        searhGroups = myGroups

        searchBar.delegate = self

    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return searhGroups.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellFootballGroup",
                                                 for: indexPath) as? GroupTableViewCell
        let group = searhGroups[indexPath.row]
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
        updateFilterResult(searchText: searchBar.text ?? "")
    }
    
    func userSubscribe(group: Group) {
        myGroups.append(group)
        updateFilterResult(searchText: searchBar.text ?? "")
    }

}

extension MyGroupTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        updateFilterResult(searchText: searchText)
    }

    func updateFilterResult(searchText: String) {
        searhGroups = myGroups.filter { $0.name.lowercased().hasPrefix(searchText.lowercased()) }
        tableView.reloadData()
    }
}
