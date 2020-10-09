//
//  Quick_ActionsApp.swift
//  Quick Actions
//
//  Created by Azhagusundaram Tamil on 08/10/20.
//

import SwiftUI
import UIKit

let quickActionSettings = QuickActionSettings()
var shortcutItemToProcess: UIApplicationShortcutItem?

@main
struct Quick_ActionsApp: App {
    @Environment(\.scenePhase) var phase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(quickActionSettings)
        }
        .onChange(of: phase) { (newPhase) in
            switch newPhase {
            case .active :
                print("App in active")
                guard let name = shortcutItemToProcess?.userInfo?["name"] as? String else {
                    return
                }
                switch name {
                case "call":
                    print("call is selected")
                    quickActionSettings.quickAction = .details(name: name)
                case "chat":
                    print("chat is selected")
                    quickActionSettings.quickAction = .details(name: name)
                case "status":
                    print("status is selected")
                    quickActionSettings.quickAction = .details(name: name)
                case "contact":
                    print("contct is selected")
                    quickActionSettings.quickAction = .details(name: name)
                default:
                    print("default ")
                }
            case .inactive:
                // inactive
                 print("App is inactive")
            case .background:
                print("App in Back ground")
                addQuickActions()
            @unknown default:
                print("default")
            }
        }
    }
    
    /**
     During the transition to a background state is a good time to update any dynamic quick actions because this code is always executed before the user returns to the Home screen.
     */
    
    func addQuickActions() {
        var calluserInfo: [String: NSSecureCoding] {
            return ["name" : "call" as NSSecureCoding]
        }
        var chatuserInfo: [String: NSSecureCoding] {
            return ["name" : "chat" as NSSecureCoding]
        }
        var statususerInfo: [String: NSSecureCoding] {
            return ["name" : "status" as NSSecureCoding]
        }
        var contactuserInfo: [String: NSSecureCoding] {
            return ["name" : "contact" as NSSecureCoding]
        }
        
        UIApplication.shared.shortcutItems = [
            UIApplicationShortcutItem(type: "Call", localizedTitle: "Call", localizedSubtitle: "", icon: UIApplicationShortcutIcon(type: .cloud), userInfo: calluserInfo),
            UIApplicationShortcutItem(type: "Chat", localizedTitle: "Chat", localizedSubtitle: "", icon: UIApplicationShortcutIcon(type: .message), userInfo: chatuserInfo),
            UIApplicationShortcutItem(type: "Status", localizedTitle: "Status", localizedSubtitle: "", icon: UIApplicationShortcutIcon(type: .captureVideo), userInfo: statususerInfo),
            UIApplicationShortcutItem(type: "Contacts", localizedTitle: "Contacts", localizedSubtitle: "", icon: UIApplicationShortcutIcon(type: .contact), userInfo: contactuserInfo),
        ]
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        if let shortcutItem = options.shortcutItem {
            shortcutItemToProcess = shortcutItem
        }
        
        let sceneConfiguration = UISceneConfiguration(name: "Custom Configuration", sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = CustomSceneDelegate.self
        
        return sceneConfiguration
    }
}

class CustomSceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        shortcutItemToProcess = shortcutItem
    }
}
