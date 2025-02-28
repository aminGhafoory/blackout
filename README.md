# Rolling Blackouts Notifier

A Flutter-based application that notifies users about scheduled rolling blackouts in their area. The app stores user configuration using `shared_preferences` for a seamless experience.

## Features

- **Blackout Schedule Tracking**: View upcoming rolling blackouts in your selected region.
- **Lightweight Storage**: Uses `shared_preferences` for storing user preferences.
- **Simple & Intuitive UI**: Easy-to-use interface designed for quick access to important information.

## Installation

### Prerequisites

- [Flutter](https://flutter.dev/) installed on your system.

### Steps

1. **Clone the Repository**
   ```sh
   git clone https://github.com/aminGhafoory/blackout.git
   cd blackout
   ```
2. **Install Dependencies**
   ```sh
   flutter pub get
   ```
3. **Run the Application**
   ```sh
   flutter run
   ```

## Usage

1. harvest your jwt token from [bargheman.com](https://bargheman.com).
2. Open the app and set your bill ID and jwt.
3. Receive alerts before blackouts occur.

## Configuration

- **Data Storage**: User settings are stored locally using `shared_preferences`.

## Contributing

1. Fork the repository.
2. Create a new branch (`feature-new-feature`).
3. Commit your changes.
4. Push to your fork and create a pull request.

## License

MIT License. See `LICENSE` for details.

---

Let us know if you have any feedback or suggestions! 🚀

