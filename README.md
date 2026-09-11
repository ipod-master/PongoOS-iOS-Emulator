# PongoOS iOS Emulator

An iOS Xcode app that emulates the PongoOS bootloader environment. This educational tool simulates the boot sequence, device tree parsing, and kernel initialization process visible in the checkra1n jailbreak toolchain.

## Features

- **Boot Sequence Simulation**: Emulates the PongoOS boot stages
- **Terminal Interface**: Real-time boot log display
- **Device Tree Parser**: Simulates device tree initialization
- **Boot Arguments**: Simulates boot_args structure and kernel initialization
- **Memory Simulation**: Virtual memory mapping display
- **Linux Integration**: Simulates Linux boot flag and cmdline handling

## Requirements

- iOS 14.0+
- Xcode 13.0+
- Swift 5.5+

## Building

1. Clone this repository
2. Open `PongoOS-iOS-Emulator.xcodeproj` in Xcode
3. Select your target device
4. Build and run (Cmd+R)

## Project Structure

```
PongoOS-iOS-Emulator/
├── PongoOS-iOS-Emulator/
│   ├── App/
│   │   └── PongoOSEmulatorApp.swift
│   ├─�� Views/
│   │   ├── ContentView.swift
│   │   ├── TerminalView.swift
│   │   └── BootStatusView.swift
│   ├── Models/
│   │   ├── BootArgs.swift
│   │   ├── DeviceTree.swift
│   │   └── BootSequence.swift
│   ├── Services/
│   │   ├── BootSimulator.swift
│   │   ├── TerminalLogger.swift
│   │   └── DeviceTreeParser.swift
│   └── Assets/
│       └── Assets.xcassets
└── PongoOS-iOS-EmulatorTests/
    └── BootSimulatorTests.swift
```

## References

- [PongoOS Source Code](https://github.com/checkra1n/PongoOS)
- [checkra1n Project](https://checkra.in)
- Apple Device Tree Specification

## License

This project is for educational purposes. PongoOS is licensed under MIT by the checkra1n team.

## Disclaimer

This is a simulation/emulation tool for educational purposes only. It does not perform any actual bootloader operations or jailbreaking.