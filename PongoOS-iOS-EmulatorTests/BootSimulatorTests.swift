import XCTest
@testable import PongoOS_iOS_Emulator

final class BootSimulatorTests: XCTestCase {
    func testDefaultBootArgsAreInitialized() {
        let args = BootArgs.createDefault()

        XCTAssertEqual(args.revision, 2)
        XCTAssertEqual(args.version, 11)
        XCTAssertEqual(args.commandLine, "debug=0x00000014 serial=1 halt_on_panic")
        XCTAssertEqual(args.video.width, 1280)
        XCTAssertEqual(args.video.height, 960)
    }

    func testDefaultDeviceTreeContainsExpectedNodes() {
        let tree = DeviceTree.createDefault()

        XCTAssertEqual(tree.root.name, "/")
        XCTAssertFalse(tree.root.children.isEmpty)
        XCTAssertTrue(tree.root.children.contains { $0.name == "chosen" })
        XCTAssertTrue(tree.root.children.contains { $0.name == "memory@800000000" })
    }

    func testBootSimulatorStartsReady() {
        let simulator = BootSimulator()

        XCTAssertEqual(simulator.bootStatus, "Ready")
        XCTAssertTrue(simulator.bootLogs.isEmpty)
    }

    func testBootSimulatorAddsLogsWhenBootStarts() {
        let simulator = BootSimulator()
        simulator.startBootSequence()

        XCTAssertFalse(simulator.bootLogs.isEmpty)
        XCTAssertTrue(simulator.bootLogs.contains { $0.contains("pongoOS") })
    }
}
