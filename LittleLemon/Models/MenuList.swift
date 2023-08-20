//
//  MenuList.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 18.08.23.
//

import Foundation

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}
