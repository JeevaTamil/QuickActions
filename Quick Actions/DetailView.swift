//
//  DetailVIew.swift
//  Quick Actions
//
//  Created by Azhagusundaram Tamil on 08/10/20.
//

import SwiftUI

struct DetailView: View {
    
    var name: String
    
    var body: some View {
        Text("\(name) View")
            .navigationBarTitle(name)
    }
}


