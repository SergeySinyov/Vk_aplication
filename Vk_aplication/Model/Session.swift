//
//  Session.swift
//  Vk_aplication
//
//  Created by Сергей Синёв on 11.06.2022.
//

import UIKit

class Session {
    internal init(token: String = """
 vk1.a.Fp3ADxGaLYRG-oebISaPOMs3bmWgSsoSOCGtrmnTYyBC7C4iwWrh21OyJXLxSb41VFOJME9nffCizhuCHtnxvt9cxLquU14Y8KDI
9mpqOKSqCYNysd15SN-vJyIufl9Wfp8YKebnCLT_9ilT7MQfpSdTIFGAKNZr3KGYu6-pFQlP-pyz0CH9RMzm1L_6q-Ak

""", userId: Int = 0) {
        self.token = token
        self.userId = userId
    }
    

    static let instance = Session()

    private init() {}

    var token: String =
"""
 vk1.a.Fp3ADxGaLYRG-oebISaPOMs3bmWgSsoSOCGtrmnTYyBC7C4iwWrh21OyJXLxSb41VFOJME9nffCizhuCHtnxvt9cxLquU14Y8KDI
9mpqOKSqCYNysd15SN-vJyIufl9Wfp8YKebnCLT_9ilT7MQfpSdTIFGAKNZr3KGYu6-pFQlP-pyz0CH9RMzm1L_6q-Ak

"""
    var userId: Int = 0
}





