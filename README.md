![CI workflow](https://github.com/macrae22/appium_ruby_example_iOS/actions/workflows/main.yml/badge.svg)

# ♦️ Appium Ruby Example
Automation testing using Appium, Ruby, and the Page Object Model (POM) design pattern.

## ⚙️ Setup
### 👬 Cloning project
1. Clone the project to your local machine: <br> 
```bash
git clone https://github.com/macrae22/appium_ruby_example.git
```

### 💿 Install bundler
Bundler is a dependancy manager for Ruby gems</br>

2. Download bundler
4. Install project gems
```bash
gem install bundler
bundle install
```

### 💽 Appium Server
4. Install Appium Server (http://appium.io/)
5. Start Appium Server from GUI

### 📱 Platform
This project supports both **iOS** and **Android**. Select the platform via the `PLATFORM` environment variable (defaults to `ios`):
```bash
PLATFORM=ios bundle exec rspec
PLATFORM=android bundle exec rspec
```
*   iOS uses `apps/testing-app.zip` (XCUITest)
*   Android uses `apps/testing-app.apk` (UiAutomator2) — you'll need to supply an Android build of the app at that path; one is not bundled with this repo yet.

Useful device overrides:
*   iOS: `IOS_PLATFORM_VERSION`, `IOS_DEVICE_NAME`
*   Android: `ANDROID_PLATFORM_VERSION`, `ANDROID_DEVICE_NAME`

### 🧪 Running tests
6. To run all tests:
```bash
bundle exec rspec
```
7. To run a specific test:</br>
```bash
bundle exec rspec spec/tests/scroll_spec.rb
```

---

## 👩‍🔬 Test Example

This project demonstrates a horizontal & vertical swipe test.

**scroll_spec**<br />
These tests use a `swipe_until_element_is_visible` method, which allows you to swipe horizontally until a target element is found. You can see the implementation in [common/common.rb](https://github.com/macrae22/appium_ruby_example_iOS/blob/main/common/common.rb).

Page objects (e.g. [views/home/home.rb](https://github.com/macrae22/appium_ruby_example_iOS/blob/main/views/home/home.rb)) branch their locators by platform, so the same spec runs against either the iOS or Android build of the app.

## 🤖 CI
This project is set up to use **GitHub Actions** and will automatically run all UI tests when a new pull request is submitted.

You can see the CI setup in the [main.yml](https://github.com/macrae22/appium_ruby_example_iOS/blob/main/.github/workflows/main.yml) file.

There are two jobs:
*   **ios** — spins up a **macOS** virtual machine, boots an iOS Simulator, and runs the suite with `PLATFORM=ios`
*   **android** — spins up an **Ubuntu** virtual machine, boots an Android Emulator, and runs the suite with `PLATFORM=android` (this job skips the actual test run with a warning until `apps/testing-app.apk` exists)

Both jobs:
*   Check out the project code
*   Install **Ruby** and **Node.js**
*   Install the **Appium Server** and the relevant driver
*   Run the tests
*   Save the test artifacts _(test-results-ios.html / test-results-android.html, appium.log)_

## 🌱 Contribute
Feel free to contribute or request more examples.<br />
The plan is to create clean examples which help beginners get of the ground 🛫.


