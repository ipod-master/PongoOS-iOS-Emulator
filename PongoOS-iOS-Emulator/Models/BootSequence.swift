//
//  BootSequence.swift
//  PongoOS-iOS-Emulator
//
//  Boot sequence stages
//

import Foundation

enum BootStage: Int {
    case init_
    case loadDeviceTree
    case initializeMemory
    case loadBootloader
    case initializeUSB
    case parseDeviceTree
    case setupBootArgs
    case jumpToKernel
    case complete
}

struct BootMessage {
    let timestamp: Date
    let stage: BootStage
    let message: String
    let isError: Bool = false
}
