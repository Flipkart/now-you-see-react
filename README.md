<h1 align="center">
 <img src="https://raw.githubusercontent.com/Flipkart/now-you-see-react/master/NowYouSeeReact.png" width="200" alt="Logo"/> 
 <br/>
 <br/>
 Now You See Me
</h1>

[![Platform](https://img.shields.io/badge/platform-ios-lightgrey)](https://github.com/Flipkart/now-you-see-react)
[![Swift](https://img.shields.io/badge/swift-5-orange)](https://developer.apple.com/swift/)
[![License](https://img.shields.io/badge/license-Apache%2C%20Version%202.0-purple)](https://github.com/Flipkart/now-you-see-me/blob/master/LICENSE)
<br/>
<br/>
NowYouSeeReact adds support for react native views on top of the iOS tracking framework [NowYouSeeMe](https://github.com/Flipkart/now-you-see-me).

## Need

*There is no Cell class in React Native equivalent to ```UIKit```'s ```UITableViewCell``` or ```UICollectionViewCell```.*

Hence, it becomes difficult to identify when a react native view (```RCTView```) is recycled as we do not have access to the actual recycled view (cell) which in turn causes problems in calculating the absolute frame and viewability of the view and its subviews once recycled.

Hence, as a solution to the problem, we have enabled tracking for all the react native views by default, so that we can get hold of the recycled react native view (cell) and successfully update the viewability of all of its children.

## Usage
To enable the framework you need to call the following method before the UI is created:

~~~swift
NowYou.seeReact()  // didFinishLaunchingWithOptions is a good place to initialise the framework
~~~

The method internally calls ```NowYou.seeMe()``` to enable the parent framework

For all other usage details, please refer [NowYouSeeMe](https://github.com/Flipkart/now-you-see-me).

## Demo project
There is a demo project present in the Example directory.
The demo project contains a react native app which consists of a recyler list view, and each item in the recyler list view is a native view component with viewability conditions attached to it.
Demo is created using [react-native-cli](https://www.npmjs.com/package/react-native-cli)

#### Steps to run demo project
* Clone the repo
* ```cd``` into Example/ios folder
* ```pod install```
* open NowYouSeeReact.xcworkspace
* Build and run
* In case port 8081 is already occupied and you get an error, replace all occurrences of 8081 with some other port number and run ```npm start --port={port number}``` in terminal, post which you can build and run the demo app

#### Running demo
![NowYouSeeReact-Demo](https://raw.githubusercontent.com/Flipkart/now-you-see-react/master/Demo.gif)


## Installation

To integrate NowYouSeeMe into your Xcode project using CocoaPods, specify it in your ```Podfile```:

```ruby
pod 'NowYouSeeReact', :git => 'https://github.com/Flipkart/now-you-see-react.git', :tag => '1.0.0'

# Not able to push to cocoapods due to React dependency
```

Then, run the following command:

```bash
$ pod install
```

## Dependencies
* [NowYouSeeMe](https://github.com/Flipkart/now-you-see-me)
* [React Native](https://github.com/facebook/react-native)

## Requirements
* iOS 10.0+
* Swift 5

---

[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=flipkart/now-you-see-react)](http://clayallsopp.github.io/readme-score/?url=flipkart/now-you-see-react)
