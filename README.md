# DinamicNotes - Dynamic Island Event Tracker

This is a native iOS application built with Swift and SwiftUI that demonstrates how to use **ActivityKit** to show events in the **Dynamic Island**.

## 🚀 Setup Instructions

Since you are working on Windows, follow these steps to build and run the app on a Mac (or via a cloud-based Mac like MacStadium or XcodeCloud).

### 1. Create the Xcode Project
1. Open **Xcode** on a Mac.
2. Select **Create a new Xcode project**.
3. Choose **App** under the iOS tab.
4. Product Name: `DinamicNotes`.
5. Interface: **SwiftUI**, Language: **Swift**.

### 2. Add the Widget Extension (Crucial)
1. In Xcode, go to **File > New > Target**.
2. Search for **Widget Extension** and select it.
3. Product Name: `DynamicIslandWidgetExtension`.
4. **IMPORTANT**: Uncheck "Include Configuration Intent" (we are using ActivityKit, not static widgets).
5. Click **Finish**.
6. When asked "Activate 'DynamicIslandWidgetExtension' scheme?", click **Activate**.

### 3. Copy the Files
1. Replace the contents of the generated files with the code provided in this repository:
   - `ContentView.swift`
   - `DinamicNotesApp.swift`
2. Add the following new files to the **DinamicNotes** folder:
   - `EventAttributes.swift`
   - `ActivityManager.swift`
3. Replace the contents of `DynamicIslandWidget.swift` in the **Widget Extension** folder.

### 4. Set Target Membership ⚠️
For **EventAttributes.swift**, you **MUST** ensure it belongs to both targets:
1. Select `EventAttributes.swift` in the Project Navigator.
2. In the **File Inspector** (right sidebar), under **Target Membership**, check both:
   - [x] `DinamicNotes`
   - [x] `DynamicIslandWidgetExtension`

### 5. Enable Live Activities
1. Select the **DinamicNotes** project in the Project Navigator.
2. Go to the **Info** tab.
3. Add a new key: `NSSupportsLiveActivities`.
4. Set its value to `YES`.

### 6. Run the App
1. Select an **iPhone 14 Pro** or newer (or Simulator) as the run target.
2. Press **Cmd + R** to build and run.
3. Enter an event name, set the minutes, and tap **Launch to Island**.
4. **Swipe up** to go to the Home Screen and see the Dynamic Island in action!

## 🛠 Features
- **Compact UI**: Shows a timer icon and a countdown.
- **Expanded UI**: Shows the full event name, a progress bar, and a large countdown.
- **Minimal UI**: Shows the icon when multiple apps are active in the Island.
- **Lock Screen**: Shows a beautiful notification card with a live timer.

## 📦 GitHub Deployment
You can push this folder to a GitHub repository. If you set up **GitHub Actions** with a macOS runner, you can automate the build process (requires an Apple Developer Program membership for signing).
