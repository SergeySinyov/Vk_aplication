//
//  Friend.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 26.06.2022.
//

import UIKit
import RealmSwift

class Friend: Object, Decodable  {
    init(id: Int = 0, trackCode: String = "", photo: String = "", firstName: String = "",
         lastName: String = "", canAccessClosed: Bool, isClosed: Bool) {
        self.id = id
        self.trackCode = trackCode
        self.photo = photo
        self.firstName = firstName
        self.lastName = lastName
        self.canAccessClosed = canAccessClosed
        self.isClosed = isClosed
    }


    @Persisted var id: Int = 0
    @Persisted var trackCode: String = ""
    @Persisted var photo: String = ""
    @Persisted var firstName: String = ""
    @Persisted var lastName: String = ""
    @Persisted var canAccessClosed: Bool
    @Persisted var isClosed: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case trackCode = "track_code"
        case photo = "photo_100"
        case firstName = "first_name"
        case lastName = "last_name"
        case canAccessClosed = "can_access_closed"
        case isClosed = "is_closed"

    }

    convenience required init(from decoder: Decoder) throws {
        try self.init(from: Decoder.self as! Decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.trackCode = try container.decode(String.self, forKey: .trackCode)
        self.photo = try container.decode(String.self, forKey: .photo)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.canAccessClosed = try container.decode(Bool.self, forKey: .canAccessClosed)
        self.isClosed = try container.decode(Bool.self, forKey: .isClosed)

    }
}
