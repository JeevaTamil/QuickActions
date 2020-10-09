//
//  ListView.swift
//  Quick Actions
//
//  Created by Azhagusundaram Tamil on 08/10/20.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var quickActionSettings: QuickActionSettings
    @State var selectedAction: Int?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<allQuickActions.count) { index in
                    NavigationLink(destination: DetailView(name: allQuickActions[index].name), tag: allQuickActions[index].tag, selection: $quickActionSettings.quickAction) {
                        Text(allQuickActions[index].name)
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Quick Actions")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}


struct QuickActionModel : Identifiable {
    let id = UUID()
    let name: String
    let tag: QuickActionSettings.QuickAction
}


let allQuickActions = [
    QuickActionModel(name: "Contacts", tag: .details(name: "contact")),
    QuickActionModel(name: "Chats",tag: .details(name: "chat")),
    QuickActionModel(name: "Calls", tag: .details(name: "call")),
    QuickActionModel(name: "Status", tag: .details(name: "status")),
]
