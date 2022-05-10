//
//  Group.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 15.04.2022.
//

import Foundation

struct Group {

    let id: String
    let name: String
    let avatar: String

    static var allGroups: [Group] = [
        Group(id: "1", name: "Футбол", avatar: "groupFootball"),
        Group(id: "2", name: "Новости Мира", avatar: "groupNews"),
        Group(id: "3", name: "Авто каждый день", avatar: "groupCar"),
        Group(id: "4", name: "Новинки Кино", avatar: "groupFilms"),
        Group(id: "5", name: "Мода", avatar: "groupFasion"),
        Group(id: "6", name: "Веб дизайн", avatar: "groupWebDesign")
    ]

}
