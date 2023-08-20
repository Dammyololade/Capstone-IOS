//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 18.08.23.
//

import Foundation

struct MenuItem: Codable, Hashable, Identifiable {
    let id = UUID()
    
    var title: String
    var image: String
    var price: String
    var category: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case category = "category"
        case image = "image"
        case description = "description"
    
    }
    
}
