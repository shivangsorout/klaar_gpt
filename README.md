# Building and Running the Flutter Application

## Prerequisites:
Before you begin, ensure you have the following installed:
- **Flutter SDK:** Follow the official Flutter installation instructions for your operating system.
- **Dart SDK:** Flutter requires the Dart SDK. It's included with the Flutter SDK, so you don't need to install it separately.
- **Android Studio/VS code or Xcode:** Depending on whether you're targeting Android or iOS, you'll need either Android Studio/VS code or Xcode installed.
## Getting Started:
1. Clone the repository:
	```
	git clone https://github.com/shivangsorout/klaar_gpt.git
	```
2. Navigate to the project directory:
	```
	cd <project_directory>
	```
3. Install dependencies:
	```
	flutter pub get
	```
## Running the Application:
- **Android**   
Ensure you have an Android device connected via USB or an Android emulator running.   

- Run the command in terminal:
 ```
 flutter run
 ```
- **iOS**   
Ensure you have a macOS machine with Xcode installed.   

- Run the command in terminal:
 ```
 flutter run
 ```

## Configuration
### API Key
To use the Google Gemini API in the Flutter application, you'll need to obtain an API key:
1. Log in to the [Google AI Studio](https://ai.google.dev/) for the Gemini AI and click Get API Key.
2. Click Create API key in new project.
3. Copy your key to your clipboard.

### Configuring API Key in the App
Once you have obtained the API key, you need to configure it in the Flutter application:
1. **Create the .env file:** If it doesn't exist already, create a .env file in the root directory of your Flutter project.
2. **Store the API Key:** Inside the .env file, add a line to store your Gemini API key:

```
geminiApiKey = YOUR_API_KEY_HERE
```

By following these steps, you can configure and access your Gemini API key securely within your Flutter application without needing additional package setup.
## Additional Notes

- Ensure that your device (physical or emulator) has internet access to communicate with the Gemini API server.
- Test the application thoroughly on both Android and iOS devices to ensure compatibility and functionality.

By following these instructions, you'll be able to build, run, and configure the Flutter application to use the Gemini API securely.
