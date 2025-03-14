# iProov Testing iOS App 

Welcome to the **iProov Testing iOS App** repository! This project is an iOS application built using Swift and SwiftUI/UIKit.
[![](https://raw.githubusercontent.com/fawadniazi/iProov/refs/heads/main/SC1.png)](https://raw.githubusercontent.com/fawadniazi/iProov/refs/heads/main/SC1.png)

## Table of Contents
- [Requirements](#requirements)
- [Installation](#installation)
- [Build and Run](#build-and-run)
- [Contributing](#contributing)
- [License](#license)

## Requirements
Before you get started, ensure you have the following installed:

- macOS (latest version recommended)
- Xcode (latest stable version)
- Swift (latest stable version included with Xcode)
- CocoaPods (if dependencies are managed using it) - Install via:
  ```sh
  sudo gem install cocoapods
  ```
- Homebrew (optional for additional dependencies) - Install via:
  ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

## Installation
Clone this repository to your local machine:
```sh
git clone https://github.com/fawadniazi/iProov.git
cd iProov
```

If the project uses CocoaPods, install dependencies:
```sh
pod install
```
Then, open the `.xcworkspace` file instead of `.xcodeproj`:
```sh
open iProov.xcworkspace
```

## Build and Run

1. Open the project in Xcode:
   ```sh
   open iProov.xcworkspace  # If using CocoaPods
   open iProov.xcodeproj     # If not using CocoaPods
   ```
2. In the  `Credentials.swift` Update the Base URL, API Key and Secret
3. Select a simulator or a connected iOS device from the Xcode toolbar. **This will only work on a real device**; it will not work in the simulator.
4. Build and run the app using:
   - Click the **Run** button (▶️) in Xcode.
   - Or use the shortcut: `Cmd + R`.

### Running on a Physical Device
To run on an actual iPhone or iPad:
1. Connect the device via USB.
2. Ensure you have an Apple Developer account and have set up code signing in Xcode under **Signing & Capabilities**.
3. Select your device and build the project.

## Contributing
Contributions are welcome! To contribute:
1. Fork the repository.
2. Create a new branch: `git checkout -b feature-branch`.
3. Make your changes and commit: `git commit -m "Add new feature"`.
4. Push to the branch: `git push origin feature-branch`.
5. Open a Pull Request.

## License
This project is licensed under the [MIT License](LICENSE).

---

Happy coding! 🚀



