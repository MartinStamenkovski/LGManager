# LGManager

You can use this class when you need to change language in your application programatically.

## Instalation 
Just drop the [LGManager.swift](https://github.com/MartinStamenkovski/LGManager/blob/master/LGManager.swift) file into your project.

## Usage
```swift
LGManager.setLanguage(with: "<#prefix#>") 
```
where prefix is for example "en".

Simple example with ```UILabel```
```swift
let label = UILabel()
label.text = .localize(key: "username")
```

After you set language you shoud "restart" the application, for example:

```swift
LGManager.setLanguage(with: "<#prefix#>")
 
 let storyboard = UIStoryboard(name: "Main", bundle: nil)
 let tabController = storyboard.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
 UIView.transition(with: keyWindow, duration: 0.4, options: [.transitionFlipFromLeft, .curveEaseInOut], animations: {
     keyWindow.rootViewController = tabController
     keyWindow.makeKeyAndVisible()
  }, completion: nil)
```
## License
[MIT](https://github.com/MartinStamenkovski/LGManager/blob/master/LICENSE)
