# BWTVController

[![CI Status](http://img.shields.io/travis/qkrqjadn/BWTVController.svg?style=flat)](https://travis-ci.org/qkrqjadn/BWTVController)
[![Version](https://img.shields.io/cocoapods/v/BWTVController.svg?style=flat)](http://cocoapods.org/pods/BWTVController)
[![License](https://img.shields.io/cocoapods/l/BWTVController.svg?style=flat)](http://cocoapods.org/pods/BWTVController)
[![Platform](https://img.shields.io/cocoapods/p/BWTVController.svg?style=flat)](http://cocoapods.org/pods/BWTVController)

![](https://github.com/qkrqjadn/BWTVController/blob/master/ezgif.com-resize.gif)
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.




## Installation

BWTVController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BWTVController"
```

## Start

BWTVController needs BWTVHeaderView array

```swift
self.headerViews = [BWTVHeaderView]()
```

and BWTVHeaderView need to expandState
```swift
let headerview = BWTVHeaderView()
headerview.expandState = .expand
```
or
```swift
headerview.expandState = .reduce
```

easy way to use the code is write bottom code
```swift

for _ in 1..<5{
    let headerview = BWTVHeaderView()
    headerview.expandState = .expand
    headerview.childRows = 2
    self.headerViews?.append(headerview)
}

```   

and manipulate section height  and heightForRow
ex)
```swift
self.heightForRowAt = 100
self.heightForHeaderInSection = 50
```

if you don't want to display top section `isTopSectionDisplay` set `false`


## Author

qkrqjadn, qjadn0914@naver.com

## License

BWTVController is available under the MIT license. See the LICENSE file for more info.
