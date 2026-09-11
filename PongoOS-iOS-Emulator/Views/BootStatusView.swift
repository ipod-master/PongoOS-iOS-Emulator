//
//  BootStatusView.swift
//  PongoOS-iOS-Emulator
//
//  Status display for boot sequence
//

import SwiftUI

struct BootStatusView: View {
    let status: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(statusColor)
                .frame(width: 8, height: 8)
            
            Text(status)
                .font(.system(.caption, design: .monospaced))
                .foregroundColor(.green)
            
            Spacer()
        }
        .padding(10)
        .background(Color(red: 0.08, green: 0.08, blue: 0.1))
    }
    
    private var statusColor: Color {
        switch status {
        case let s where s.contains("Running"):
            return .green
        case let s where s.contains("Complete"):
            return .green
        case let s where s.contains("Error"):
            return .red
        default:
            return .yellow
        }
    }
}

#Preview {
    BootStatusView(status: "Running boot sequence...")
}
