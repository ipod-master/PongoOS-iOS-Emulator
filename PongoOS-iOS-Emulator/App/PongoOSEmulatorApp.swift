//
//  PongoOSEmulatorApp.swift
//  PongoOS-iOS-Emulator
//
//  Entry point for the PongoOS emulator application
//

import SwiftUI

@main
struct PongoOSEmulatorApp: App {
    let bootSimulator = BootSimulator()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bootSimulator)
        }
    }
}
