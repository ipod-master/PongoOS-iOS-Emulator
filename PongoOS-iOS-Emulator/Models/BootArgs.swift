//
//  BootArgs.swift
//  PongoOS-iOS-Emulator
//
//  Boot arguments structure based on PongoOS boot_args
//

import Foundation

// Mirrors the boot_args structure from PongoOS
struct BootArgs {
    struct BootVideo {
        var baseAddr: UInt64
        var display: UInt64
        var rowBytes: UInt64
        var width: UInt64
        var height: UInt64
        var depth: UInt64
    }
    
    var revision: UInt16
    var version: UInt16
    var virtBase: UInt64
    var physBase: UInt64
    var memSize: UInt64
    var topOfKernelData: UInt64
    var video: BootVideo
    var machineType: UInt32
    var deviceTreePtr: UInt64
    var deviceTreeLength: UInt32
    var commandLine: String
    var bootFlags: UInt64
    var memSizeActual: UInt64
    
    static func createDefault() -> BootArgs {
        return BootArgs(
            revision: 2,
            version: 11,
            virtBase: 0xFFFFFFF000000000,
            physBase: 0x800000000,
            memSize: 0x200000000, // 8GB
            topOfKernelData: 0x0,
            video: BootVideo(
                baseAddr: 0x0,
                display: 0x0,
                rowBytes: 2560,
                width: 1280,
                height: 960,
                depth: 32
            ),
            machineType: 0x00000000, // Apple device
            deviceTreePtr: 0x0,
            deviceTreeLength: 0,
            commandLine: "debug=0x00000014 serial=1 halt_on_panic",
            bootFlags: 0x0,
            memSizeActual: 0x200000000
        )
    }
}
