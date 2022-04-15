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
        Group(id: "1", name: "Footbal", avatar: "groupFootball"),
        Group(id: "2", name: "News", avatar: "groupNews"),
        Group(id: "3", name: "Cars", avatar: "groupCar"),
        Group(id: "4", name: "Films", avatar: "groupFilms"),
        Group(id: "5", name: "Fasion", avatar: "groupFasion"),
        Group(id: "6", name: "WebDesing", avatar: "groupWebDesign")
    ]

}
