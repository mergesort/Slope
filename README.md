# GradientKit

#### Flat is out so let's make depth easy.

---

### Gradients are coming back in style, so let's party like it's 1989 again. 

Use them for backgrounds, use them for UI elements, use them to make yourself happy.

![](Images/gradient_examples.png)

---

#### Using GradientKit is simple. Even a _very well_ trained seal can use it.

The built in `CAGradientLayer` API is overly complex, doesn't work with auto layout, and is very fiddly. In one step you can create a `GradientView` and start making prettier controls.

```swift
import GradientKit

let gradientView = GradientView()
gradientView.gradient = UniformGradient(colors: [.darkGrayColor, .lightGrayColor])
```

There is no step 2. You now have a `UIView` subclass you can add to your screen.

#### Types of Gradients

There are two current types of gradients, `UniformGradient` and `PercentageGradient`. 

You can create your own as you see fit by conforming to the `Gradient` protocol.

- If you want to make a radial gradient, go wild. 
- If you want to make a diagonal gradient, that works too. 
- If you come up with something creative, contribute to the project!


## Installation
You can use [CocoaPods](http://cocoapods.org/) to install `GradientKit` by adding it to your `Podfile`:

```swift
platform :ios, '9.0'
use_frameworks!

pod 'GradientKit'
```

Or install it manually by downloading `Gradient.swift`, `UniformGradient.swift`, `PercentageGradient.swift`, and `GradientView.swift`, and dropping them in your project.

## About me

Hi, I'm [Joe](http://fabisevi.ch) everywhere on the web, but especially on [Twitter](https://twitter.com/mergesort).

## License

See the [license](LICENSE) for more information about how you can use GradientKit.

## Is that it?

Yep, that's it. Good night, and have a pleasant tomorrow.
