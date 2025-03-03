![CI workflow](https://github.com/macrae22/appium_ruby_example_iOS/actions/workflows/main.yml/badge.svg)

# ♦️ Appium ruby example (iOS)
Android automation testing using Appium, Ruby, and design pattern Page Object Model (POM).

## ⚙️ Setup
### 👬 Cloning project
1. Clone the project <br> 
```
git clone https://github.com/macrae22/appium_ruby_example_iOS.git
```

### 💿 Install bundler
Bundler is a dependancy manager for Ruby gems</br>

2. Download bundler <br>
4. Install project gems <br>
```
gem install bundler
bundle install
```

### 💽 Appium Server
4. Install Appium Server (http://appium.io/)
5. Start Appium Server from GUI

### 🧪 Running tests
6. Run to run all tests
7. Run for a specific test spec <br>
```
bundle exec rspec
bundle exec rspec spec/tests/horizontalscrolltest.rb
```

-------------------------
## Test Examples
There are 4 main examples which I hope will help you.  

**verticalscrolltest**  
There is a [scroll_to](https://github.com/macrae22/appium_ruby_example_iOS/blob/2ec14f3a01814c66148a4fc0892dbf3fa87cab23/common/common.rb#L13) method which allows you to scroll vertically to an element.

**horizontalscrolltest**
This test uses a [swipe_to](https://github.com/macrae22/appium_ruby_example_iOS/blob/2ec14f3a01814c66148a4fc0892dbf3fa87cab23/common/common.rb#L41) method which allows you to swipe horizontally to an element.

**deeplinktest**
Deeplink testing is very straight forward in Appium, check it out.

**logintest**
This test contains a method _(scenario)_ to login _(essentially extracting out login steps into a method)_

-------------------------
## 🤖 CI
This project is setup to use **Github Actions** and will kick-off all UI tests when a new pull-request is submitted.

You can see the CI setup within [main.yml](https://github.com/macrae22/ruby_appium_example_iOS/tree/main/.github/workflows).

Essentially it does the following:
* Spins up a **MacOS-11** VM
* Checkouts the project
* Installs **Ruby**
* Sets up **node**
* Installs **Appium Server**
* Runs tests
* Generates **testing results report**

