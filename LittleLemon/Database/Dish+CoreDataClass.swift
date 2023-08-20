//
//  Dish+CoreDataClass.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 20.08.23.
//
//

import Foundation
import CoreData

@objc(Dish)
public class Dish: NSManagedObject {

    func formatPrice() -> String {
        let cPrice = Float(price ?? "0")!
        let spacing = cPrice < 10 ? " " : ""
        return "$ " + spacing + String(format: "%.2f", cPrice)
    }
}
