//
//  ContentView.swift
//  PongoOS-iOS-Emulator
//
//  Main content view with boot simulation controls
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var bootSimulator: BootSimulator
    @State private var isBooting = false
    
    var body: some View {
        ZStack {
            // Dark background (bootloader aesthetic)
            Color(red: 0.1, green: 0.1, blue: 0.12)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text("PongoOS Emulator")
                        .font(.system(.title2, design: .monospaced))
                        .foregroundColor(.green)
                        .bold()
                    
                    Text("Educational Boot Sequence Simulator")
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .background(Color(red: 0.08, green: 0.08, blue: 0.1))
                .borderBottom(color: .green, width: 1)
                
                // Terminal output
                TerminalView(logs: bootSimulator.bootLogs)
                    .frame(maxHeight: .infinity)
                
                // Status bar
                BootStatusView(status: bootSimulator.bootStatus)
                    .borderTop(color: .green, width: 1)
                    .background(Color(red: 0.08, green: 0.08, blue: 0.1))
                
                // Control buttons
                HStack(spacing: 12) {
                    Button(action: startBoot) {
                        Text("Start Boot")
                            .font(.system(.caption, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(isBooting ? Color.gray : Color.green)
                            .foregroundColor(.black)
                            .cornerRadius(6)
                    }
                    .disabled(isBooting)
                    
                    Button(action: resetBoot) {
                        Text("Reset")
                            .font(.system(.caption, design: .monospaced))
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(Color.orange)
                            .foregroundColor(.black)
                            .cornerRadius(6)
                    }
                    .disabled(isBooting)
                }
                .padding(12)
                .background(Color(red: 0.08, green: 0.08, blue: 0.1))
                .borderTop(color: .green, width: 1)
            }
        }
    }
    
    private func startBoot() {
        isBooting = true
        bootSimulator.startBootSequence()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            isBooting = false
        }
    }
    
    private func resetBoot() {
        bootSimulator.resetBootSequence()
    }
}

struct BorderBottom: ViewModifier {
    let color: Color
    let width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .border(color, width: width)
    }
}

struct BorderTop: ViewModifier {
    let color: Color
    let width: CGFloat
    
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            Divider()
                .frame(height: width)
                .background(color)
            content
        }
    }
}

extension View {
    func borderBottom(color: Color, width: CGFloat) -> some View {
        self.modifier(BorderBottom(color: color, width: width))
    }
    
    func borderTop(color: Color, width: CGFloat) -> some View {
        self.modifier(BorderTop(color: color, width: width))
    }
}

#Preview {
    ContentView()
        .environmentObject(BootSimulator())
}
