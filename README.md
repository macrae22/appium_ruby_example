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

### 🧪 Running tests
6. To run all tests:
```bash
bundle exec rspec
```
7. To run a specific test:</br>
```bash
bundle exec rspec spec/tests/horizontal_scroll_spec.rb
```

---

## 👩‍🔬 Test Example

This project demonstrates a horizontal & vertical swipe test.

**scroll_spec**<br />
These tests use a `swipe_until_element_is_visible` method, which allows you to swipe horizontally until a target element is found. You can see the implementation in [common/common.rb](https://github.com/macrae22/appium_ruby_example_iOS/blob/main/common/common.rb).

## 🤖 CI
This project is set up to use **GitHub Actions** and will automatically run all UI tests when a new pull request is submitted.

You can see the CI setup in the [main.yml](https://github.com/macrae22/appium_ruby_example_iOS/blob/main/.github/workflows/main.yml) file.

The workflow performs the following steps:
*   Spins up a **macOS** virtual machine
*   Checks out the project code
*   Installs **Ruby**
*   Sets up **Node.js**
*   Installs the **Appium Server**
*   Runs the tests

## 🌱 Contribute
Feel free to contribute or request more examples.<br />
The plan is to create clean examples which help the automation community.


