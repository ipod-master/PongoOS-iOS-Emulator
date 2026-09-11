//
//  TerminalLogger.swift
//  PongoOS-iOS-Emulator
//
//  Terminal-style logging service
//

import Foundation

class TerminalLogger {
    private var logs: [String] = []
    
    func log(_ message: String) {
        let timestamp = ISO8601DateFormatter().string(from: Date())
        let formatted = "[\(timestamp)] \(message)"
        logs.append(formatted)
    }
    
    func clear() {
        logs.removeAll()
    }
    
    func getLogs() -> [String] {
        return logs
    }
}
