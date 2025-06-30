![CI workflow](https://github.com/macrae22/appium_ruby_example_iOS/actions/workflows/main.yml/badge.svg)

# ♦️ Appium Ruby Example (iOS)
iOS automation testing using Appium, Ruby, and the Page Object Model (POM) design pattern.

## ⚙️ Setup

### 1. Cloning Project
Clone the project to your local machine:
```bash
git clone https://github.com/macrae22/appium_ruby_example_iOS.git
```

### 2. Install Dependencies
Bundler is a dependency manager for Ruby gems. Install it and the project's gems:
```bash
gem install bundler
bundle install
```

### 3. Appium Server
Install and run the Appium Server. You can download it from the official [Appium website](http://appium.io/).

### 4. Running Tests
To run all tests:
```bash
bundle exec rspec
```
To run a specific test:
```bash
bundle exec rspec spec/tests/horizontal_scroll_spec.rb
```

---

## Test Example

This project demonstrates a horizontal swipe test.

**horizontal_scroll_spec**
This test uses a `swipe_until_element_is_visible` method, which allows you to swipe horizontally until a target element is found. You can see the implementation in [common/common.rb](https://github.com/macrae22/appium_ruby_example_iOS/blob/main/common/common.rb).

---

## 🤖 CI
This project is set up to use **GitHub Actions** and will automatically run all UI tests when a new pull request is submitted.

You can see the CI setup in the [main.yml](https://github.com/macrae22/appium_ruby_example_iOS/blob/main/.github/workflows/main.yml) file.

The workflow performs the following steps:
*   Spins up a **macOS** virtual machine.
*   Checks out the project code.
*   Installs **Ruby**.
*   Sets up **Node.js**.
*   Installs the **Appium Server**.
*   Runs the tests.

