## Installation

### Swift Package Manager

```
    dependencies: [
        .package(url: "https://github.com/katsuyax/CBDevice", from: "1.1.0"),
    ]
```

## Usage

```
import CBDevice

print(CBDevice.modelName()) // ex) iPhone 15
print(CBDevice.modelCode()) // ex) iPhone16,1
```

## Supported devices

iPhone/iPad/iPod touch models checked on October 13, 2026.

## License

CBDevice is available under the MIT license. See the LICENSE file for more info.
