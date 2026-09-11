//
//  TerminalView.swift
//  PongoOS-iOS-Emulator
//
//  Terminal-style log display view
//

import SwiftUI

struct TerminalView: View {
    let logs: [String]
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 2) {
                    ForEach(Array(logs.enumerated()), id: \.offset) { index, log in
                        Text(log)
                            .font(.system(.caption, design: .monospaced))
                            .foregroundColor(.green)
                            .lineLimit(1)
                            .truncationMode(.tail)
                            .id(index)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(12)
                .onChange(of: logs.count) { _ in
                    withAnimation {
                        proxy.scrollTo(logs.count - 1, anchor: .bottom)
                    }
                }
            }
        }
        .background(Color(red: 0.1, green: 0.1, blue: 0.12))
    }
}

#Preview {
    TerminalView(logs: [
        "[PONGO] Initializing boot...",
        "[PONGO] Loading device tree...",
        "[PONGO] Boot complete!"
    ])
}
