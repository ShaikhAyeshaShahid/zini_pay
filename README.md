# zini_pay

# SMS Sync App

## Overview

The SMS Sync App is a Flutter application that allows users to view and sync SMS messages and device information. The app fetches data from an API and provides offline capabilities by storing data locally using Shared Preferences. Users can view a list of devices and messages, ensuring a smooth experience even in low or no internet connectivity.

## Features

- **Fetch SMS Messages**: Retrieve a list of SMS messages from a remote API.
- **Fetch Devices**: Get a list of devices associated with the user from a remote API.
- **Offline Support**: Store fetched SMS messages and device data locally for offline access.
- **User-Friendly UI**: Beautifully designed UI to enhance user experience.
- **Automatic Data Synchronization**: Automatically fetches data from the API and falls back to local storage if the API call fails.

## Technologies Used

- **Flutter**: Framework for building cross-platform applications.
- **Bloc**: State management solution for Flutter applications.
- **Shared Preferences**: For local storage of data.
- **HTTP**: For making network requests.

## Getting Started

### Prerequisites

- Flutter SDK (version 3.24.0 or higher)
- Dart SDK
- An IDE like Android Studio or Visual Studio Code

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/ShaikhAyeshaShahid/zini_pay
