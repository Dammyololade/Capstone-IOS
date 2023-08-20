//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by Adedamola Adeyemo on 18.08.23.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: AppConstants.kHasBeenOnboarded) {
                RegisterationView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            } else {
                OnboardingMain()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
    }
}
