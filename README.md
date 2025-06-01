# ModularUserListApp

A sample iOS app built with SwiftUI that demonstrates a scalable, modular architecture. This project features:

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]

- ✅ Swift Concurrency (`async/await`)
- ✅ Combine for reactive programming
- ✅ Clean architecture with modular Swift Packages
- ✅ Dependency Injection for testability and flexibility
- ✅ Unit Testing using Swift’s modern `Testing` framework
- ✅ SwiftUI UI design with navigation and detail screens
- ✅ Integration with Kingfisher for async image loading

## Features

- 🔍 User List Screen with async data fetching
- 👤 User Detail Screen with tap actions (phone call, email)
- 🧪 Modular Network layer with tests
- 🔁 ViewModel tested for success & error states

## API

Data is fetched from:
`https://fake-json-api.mock.beeceptor.com/users`

## Architecture

- `AppModule` – Entry point
- `UserListModule` – List screen logic & view
- `UserDetailModule` – Detail screen logic & view
- `NetworkModule` – API client & network abstraction
- `CoreModule` – Models, Utilities, Extensions


## Requirements

- iOS 17.0+
- Swift 6.0
- Xcode 16.2+


## Assumptions & Limitations

- ✅ The app assumes a stable internet connection is available. No offline support or retry mechanism is implemented.
- 🚫 No input validation or advanced error handling has been implemented as the focus is on architecture.
- 📱 The app is optimized for iPhone screen sizes only. for iPad or macOS app will work but UI is not optimized for the same.
- 🧪 The app uses mock/stub data only where applicable for unit testing purposes.
- 🔐 No authentication, authorization, or secure storage features have been implemented.
- 🌍 API endpoints used are publicly accessible and may change or become unavailable in the future.
- 🧱 Swift Package Manager (SPM) is used for modularization. Ensure you clone the repository properly to retain the package structure.
- 🧪 Unit tests cover the Network Layer, Service Layer, and ViewModel logic using the new Swift `Testing` framework (iOS 17+).
- ⚙️ The app uses `async/await` for async operations and demonstrates Combine in selected parts for state management and debounce.
- 🧩 SwiftUI previews are available but might not work perfectly without setting proper device/environment settings.

---

## Getting Started

1. Clone the repo
2. Open the `.xcodeproj`
3. Run on iOS Simulator or Device

## License (MIT)

Distributed under the **The MIT License (MIT)** license. See ``LICENSE`` for more information.

[swift-image]: https://img.shields.io/badge/swift-6.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: https://github.com
