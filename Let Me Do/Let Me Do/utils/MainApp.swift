//
//  Let_Me_DoApp.swift
//  Let Me Do
//
//  Created by Appnap ws27 on 20/7/23.
//

import SwiftUI

@main
struct Let_Me_DoApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LaunchScreenView()
            }.environmentObject(listViewModel)
            
        }
    }
}
