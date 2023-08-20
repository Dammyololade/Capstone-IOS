//
//  DishesModel.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 20.08.23.
//

import Foundation
import CoreData

@MainActor
class DishesModel: ObservableObject {
    
    @Published var menuItems = [MenuItem]()
    
    func reload(_ coreDataContext: NSManagedObjectContext) async {
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let urlSession = URLSession.shared
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let menu = try! JSONDecoder().decode(MenuList.self, from: data)
            menuItems = menu.menu
            
            Dish.deleteAll(coreDataContext)
            Dish.createDishFromMenu(items: menuItems, coreDataContext)
        } catch {
            print(error)
        }
    
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601
    return encoder
}


extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func itemsTask(with url: URL, completionHandler: @escaping (MenuList?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
