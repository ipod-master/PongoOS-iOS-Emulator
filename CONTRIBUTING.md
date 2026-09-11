# Contributing to PongoOS iOS Emulator

## Overview

This is an educational project that emulates the PongoOS bootloader environment. We welcome contributions that:

- Improve the boot sequence simulation accuracy
- Add new device tree features
- Enhance the UI/UX
- Add more realistic boot messages
- Improve code documentation
- Fix bugs or performance issues

## How to Contribute

### 1. Fork the Repository

Click the "Fork" button on GitHub to create your own copy.

### 2. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
git checkout -b fix/your-bug-fix
```

### 3. Make Your Changes

- Keep commits small and focused
- Write clear commit messages
- Add comments for complex logic
- Test thoroughly before pushing

### 4. Follow Code Style

- Use Swift naming conventions (camelCase for variables/functions)
- Use 4-space indentation
- Add MARK comments for organization:
  ```swift
  // MARK: - Public Methods
  // MARK: - Private Methods
  // MARK: - Initialization
  ```

### 5. Add Tests

For new features, include tests:

```swift
func testBootSequenceInitialization() {
    let simulator = BootSimulator()
    XCTAssertEqual(simulator.bootStatus, "Ready")
}
```

### 6. Push and Create Pull Request

```bash
git push origin feature/your-feature-name
```

Then open a Pull Request on GitHub with:
- Clear description of changes
- Reference to any related issues
- Screenshots if UI changes
- Testing instructions

## Areas for Contribution

### High Priority

- [ ] More realistic boot messages based on PongoOS source
- [ ] ARM instruction simulation for boot stages
- [ ] Linux boot parameter parsing
- [ ] Memory mapping visualization

### Medium Priority

- [ ] Dark/Light mode toggle
- [ ] Boot log export to file
- [ ] Customizable device configurations
- [ ] Performance metrics display

### Low Priority

- [ ] Additional app icon designs
- [ ] Internationalization (i18n)
- [ ] Animation improvements
- [ ] Sound effects

## Code Structure

```
PongoOS-iOS-Emulator/
├── App/
│   └── Main app entry point
├── Views/
│   └── SwiftUI components
├── Models/
│   └── Data structures
└── Services/
    └── Business logic
```

### Adding a New Feature

**Example: Add temperature monitoring simulation**

1. Create `Models/TemperatureData.swift`
   ```swift
   struct TemperatureData {
       let cpu: Float
       let gpu: Float
       let memory: Float
   }
   ```

2. Update `Services/BootSimulator.swift`
   ```swift
   @Published var temperature: TemperatureData?
   ```

3. Create `Views/TemperatureView.swift`
   ```swift
   struct TemperatureView: View {
       let temperature: TemperatureData
       var body: some View { ... }
   }
   ```

4. Add to `ContentView.swift`
   ```swift
   if let temp = bootSimulator.temperature {
       TemperatureView(temperature: temp)
   }
   ```

## Pull Request Guidelines

- One feature per PR
- Include descriptive title and description
- Reference related issues: "Fixes #123"
- Keep PRs focused and reasonably sized
- Ensure all tests pass: `Cmd + U` in Xcode

## Code Review Process

1. GitHub Actions runs automated tests
2. Code review by maintainers
3. Address feedback comments
4. Approval and merge

## Commit Message Format

```
Type: Brief description (50 chars or less)

Detailed explanation if needed (wrap at 72 chars)
- Bullet point 1
- Bullet point 2

Fixes #123
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

Examples:
```
feat: Add temperature monitoring to boot simulator
fix: Correct boot sequence timing delays
docs: Update BUILDING.md with troubleshooting
```

## Documentation

For new classes/functions:

```swift
/// Simulates the boot sequence on Apple hardware
/// 
/// - Parameter bootArgs: The boot arguments to use
/// - Returns: Array of boot log messages
/// - Throws: `BootError` if simulation fails
public func simulateBoot(bootArgs: BootArgs) throws -> [String] {
    // Implementation
}
```

## Questions?

Open an Issue for:
- Bug reports
- Feature requests
- Design discussions
- Questions about contributing

## License

By contributing, you agree that your contributions are licensed under the MIT License.

---

**Thank you for contributing!** 🚀
