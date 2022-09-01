//
//  CESP_viewApp.swift
//  CESP_view
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 30/08/22.
//

import SwiftUI

@main
struct CESP_viewApp: App {
    
    @StateObject private var cespController = CESPController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, cespController.container.viewContext)
        }
    }
}
