//
//  AppSettings.swift
//  Quick Actions
//
//  Created by Azhagusundaram Tamil on 09/10/20.
//

import Foundation

class QuickActionSettings: ObservableObject {
    
    enum QuickAction: Hashable {
        case home
        case details(name: String)
    }
    
    @Published var quickAction: QuickAction? = nil
}
