//
//  BootSimulator.swift
//  PongoOS-iOS-Emulator
//
//  Main boot sequence simulator
//

import Foundation

class BootSimulator: ObservableObject {
    @Published var bootLogs: [String] = []
    @Published var bootStatus: String = "Ready"
    
    private var bootMessages: [BootMessage] = []
    private let logger = TerminalLogger()
    private let deviceTree = DeviceTree.createDefault()
    private var bootArgs = BootArgs.createDefault()
    
    func startBootSequence() {
        bootLogs.removeAll()
        bootStatus = "Initializing boot sequence..."
        
        // Simulate boot with delays
        addLog("[PONGO] pongoOS 2.4.5-9412ac8b")
        addLog("[PONGO] https://checkra.in")
        addLog("[PONGO] " + String(repeating: "=", count: 20))
        addLog("[PONGO] Booted by: iBoot-c723.80.17")
        addLog("[PONGO] Built with: Clang 12.0.0 (clang-1200.0.32.27)")
        addLog("[PONGO] Running on: Apple M1 (T8103)")
        addLog("[PONGO] Disabling USB...")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.addLog("[PONGO] synopsys_otg: need usb_regs platform value? not initializing..")
            self.addLog("[PONGO] Done!")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.addLog("[PONGO] " + String(repeating: "=", count: 20))
            self.addLog("[PONGO] checkrain kpf 0.10.2")
            self.addLog("[PONGO] Proudly written in nano")
            self.addLog("[PONGO] (c) 2019-2022 Kim Jong Cracks")
            self.addLog("[PONGO] This software is not for sale")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            self.addLog("[PONGO] Get it for free at https://checkra.in")
            self.addLog("[PONGO] " + String(repeating: "=", count: 20))
            self.addLog("[PONGO] Parsing device tree...")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            let treeLines = self.deviceTree.dumpTree()
            for line in treeLines.prefix(10) {
                self.addLog("[PONGO] dt: " + line)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.addLog("[PONGO] Found " + String(self.deviceTree.root.children.count) + " root device nodes")
            self.addLog("[PONGO] Initializing NIC 2...")
            self.addLog("[PONGO] " + String(repeating: "=", count: 20)")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.addLog("[PONGO] pongoOS 1.2.1-3a32462 (EL1)")
            self.addLog("[PONGO] https://checkra.in")
            self.addLog("[PONGO] Loaded kpf 0.10.2")
            self.addLog("[PONGO] " + String(repeating: "=", count: 20)")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
            self.addLog("[PONGO] Invoking preboot hook")
            self.addLog("[PONGO] KPF: Found AMFI exec hook")
            self.addLog("[PONGO] KPF: Found AMFI mac_error hook")
            self.addLog("[PONGO] KPF: Disabled snapshot temporarily")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            self.addLog("[PONGO] Applied patches: 0xd0f0f120000, sz: 0x10000")
            self.addLog("[PONGO] Booting...")
            self.bootStatus = "Boot complete!"
        }
    }
    
    func resetBootSequence() {
        bootLogs.removeAll()
        bootStatus = "Ready"
    }
    
    private func addLog(_ message: String) {
        DispatchQueue.main.async {
            self.bootLogs.append(message)
        }
    }
}
