//
//  designcodeApp.swift
//  designcode
//
//  Created by kehinde on 01/07/2023.
//

import SwiftUI

@main
struct designcodeApp: App {
    @StateObject var appData = AppData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appData)
        }
    }
}
