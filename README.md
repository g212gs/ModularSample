# ModularUserListApp

A sample iOS app built with SwiftUI that demonstrates a scalable, modular architecture. This project features:

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

---

## Getting Started

1. Clone the repo
2. Open the `.xcodeproj`
3. Run on iOS Simulator or Device

## License

MIT

