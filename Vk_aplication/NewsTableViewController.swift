//
//  NewsTableViewController.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 02.05.2022.
//

import UIKit

struct News {
    let firstNameUser: String
    let pastNameUser: String
    let textNews: String
    let userAvatar: String
    let imageNews: String
}

struct NewsAppend {
    let character: Character
    var news: [News]
}

class NewsTableViewController: UITableViewController {

    var news: [News] = [
        News(firstNameUser: "Сергей", pastNameUser: "Синёв", textNews: "Сегодня состоялся первый запуск ракеты FalconX, с экспедицыей на Марс", userAvatar: "avatar", imageNews: "photoSeventeen"),
        News(firstNameUser: "Николай", pastNameUser: "Андреев", textNews: "Самое лучшее начало дня - это чашка крепкого кофе", userAvatar: "avatarTwo", imageNews: "photoThirteen"),
        News(firstNameUser: "Елена", pastNameUser: "Ефремова", textNews: "Сегодня отмечаем День святого Валентина - Всех с Праздником дорогие мои!!!", userAvatar: "avatarThree", imageNews: "photoThirty"),
        News(firstNameUser: "Николай", pastNameUser: "Гаврилов", textNews: "Самое что есть лучшее это отправиться в поездку на автомобиле, можно многое что переосмыслить и остаться на едине с самимо с собой, друзья советую паковать чемоданы и отправляться в поездку!!!", userAvatar: "avatarSeven", imageNews: "photoThree")]

    var newsAppend: [NewsAppend] {
        var result = [NewsAppend] ()

        for news in news {
            guard let character = news.firstNameUser.first else {
                continue
            }

            if let newsIndex = result.firstIndex(where: { $0.character == character }) {
                result [newsIndex].news.append(news)
            } else {

                let newsAppend = NewsAppend(character: character, news: [news])
                result.append(newsAppend)
            }
        }

        return result
    }

    override func numberOfSections(in tableView: UITableView) -> Int {

        return newsAppend.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let newsAppend = newsAppend[section]

        return newsAppend.news.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleNewsCell", for: indexPath) as? NewsTableViewCell
        let newsAppend = newsAppend[indexPath.section]
        let news = newsAppend.news[indexPath.row]
        cell?.avatarNews.image = UIImage(named: news.userAvatar)
        cell?.imageContent.image = UIImage(named: news.imageNews)
        cell?.firstName.text = news.firstNameUser
        cell?.pastName.text = news.pastNameUser
        cell?.textNews.text = news.textNews
        return cell ?? UITableViewCell()
    }
}
