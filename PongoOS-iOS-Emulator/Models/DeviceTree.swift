//
//  DeviceTree.swift
//  PongoOS-iOS-Emulator
//
//  Device tree structures based on PongoOS
//

import Foundation

struct DeviceTreeNode {
    var name: String
    var properties: [DeviceTreeProperty] = []
    var children: [DeviceTreeNode] = []
}

struct DeviceTreeProperty {
    var key: String
    var value: String
}

struct DeviceTree {
    var root: DeviceTreeNode
    
    static func createDefault() -> DeviceTree {
        var root = DeviceTreeNode(name: "/")
        
        // Common device tree nodes
        var chosen = DeviceTreeNode(name: "chosen")
        chosen.properties = [
            DeviceTreeProperty(key: "bootargs", value: "debug=0x00000014"),
            DeviceTreeProperty(key: "boot-uuid", value: "00000000-0000-0000-0000-000000000000")
        ]
        
        var memory = DeviceTreeNode(name: "memory@800000000")
        memory.properties = [
            DeviceTreeProperty(key: "device_type", value: "memory"),
            DeviceTreeProperty(key: "reg", value: "0x800000000 0x200000000")
        ]
        
        var cpus = DeviceTreeNode(name: "cpus")
        var cpu0 = DeviceTreeNode(name: "cpu@0")
        cpu0.properties = [
            DeviceTreeProperty(key: "device_type", value: "cpu"),
            DeviceTreeProperty(key: "compatible", value: "apple,arm-cpu")
        ]
        cpus.children = [cpu0]
        
        root.children = [chosen, memory, cpus]
        
        return DeviceTree(root: root)
    }
    
    func dumpTree(node: DeviceTreeNode = DeviceTree.createDefault().root, indent: String = "") -> [String] {
        var output: [String] = []
        output.append(indent + node.name + "/")
        
        for prop in node.properties {
            output.append(indent + "  " + prop.key + " = \"" + prop.value + "\"")
        }
        
        for child in node.children {
            output.append(contentsOf: dumpTree(node: child, indent: indent + "  "))
        }
        
        return output
    }
}
