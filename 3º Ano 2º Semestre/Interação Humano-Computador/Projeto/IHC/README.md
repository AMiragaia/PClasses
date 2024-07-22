# Road Buddy

Road Buddy is a ride-sharing app built using React Native and Expo. This README file provides instructions on how to set up and run the project on your local machine.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Running the App](#running-the-app)
4. [Troubleshooting](#troubleshooting)


## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Node.js (v14.x or later)
- npm (v6.x or later) or Yarn (v1.x or later)
- Expo CLI (v4.x or later)

## Installation

Follow these steps to set up the project:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/road-buddy.git
   cd road-buddy
   ```
2. **Install dependencies:**
   If you are using npm:
   ```bash
   npm install
   ```
   If you are using Yarn:
   ```bash
   yarn install
   ```
3. **Install Expo CLI globally (if not already installed):**
   ```bash
   npm install -g expo-cli
   ```
4. **Install the following Expo packages:**
   ```bash
   npx expo install react-native-maps
   npx expo install expo-location
   ```

## Running the App

Start the Expo development server:
```bash
expo start
```

Run the app on your device or emulator:

- For Android, scan the QR code with the Expo Go app.
- For iOS, scan the QR code with the Camera app or Expo Go app.
- Alternatively, you can run the app on an emulator/simulator:

  - For Android:
    ```bash
    expo start --android
    ```
  - For iOS:
    ```bash
    expo start --ios
    ```


## Troubleshooting

Here are some common issues and solutions:

- **Expo CLI not recognized:**
  Ensure that you have installed Expo CLI globally. Try running:
  ```bash
  npm install -g expo-cli
  ```

- **App not starting on emulator:**

   Make sure your emulator is running and properly configured. You may need to restart the emulator or your development server.

- **Dependencies issues:**

  Delete the `node_modules` folder and reinstall dependencies:
  ```bash
  rm -rf node_modules
  npm install
  ```
