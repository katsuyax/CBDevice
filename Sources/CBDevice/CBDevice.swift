//
//  The MIT License (MIT)
//
//  Copyright (c) 2024 CrossBridge(Katsuya Kato)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Darwin

public struct CBDevice {
    public static func modelCode() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)

        let mirror = Mirror(reflecting: systemInfo.machine)
        var identifier = ""

        for child in mirror.children {
            if let value = child.value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }

        return identifier
    }

    public static func modelName() -> String {
        let code = modelCode()
        return devices[code] ?? code
    }
}

extension CBDevice {
    private static let devices =
        [
            // iPhone
            "iPhone1,2" : "iPhone 3",
            "iPhone2,1" : "iPhone 3GS",
            "iPhone3,1" : "iPhone 4",
            "iPhone3,2" : "iPhone 4",
            "iPhone3,3" : "iPhone 4",
            "iPhone4,1" : "iPhone 4S",
            "iPhone5,1" : "iPhone 5",
            "iPhone5,2" : "iPhone 5",
            "iPhone5,3" : "iPhone 5c",
            "iPhone5,4" : "iPhone 5c",
            "iPhone6,1" : "iPhone 5s",
            "iPhone6,2" : "iPhone 5s",
            "iPhone7,2" : "iPhone 6",
            "iPhone7,1" : "iPhone 6 Plus",
            "iPhone8,1" : "iPhone 6S",
            "iPhone8,2" : "iPhone 6S Plus",
            "iPhone8,4" : "iPhone SE",
            "iPhone9,1" : "iPhone 7",
            "iPhone9,3" : "iPhone 7",
            "iPhone9,2" : "iPhone 7 Plus",
            "iPhone9,4" : "iPhone 7 Plus",
            "iPhone10,1" : "iPhone 8",
            "iPhone10,4" : "iPhone 8",
            "iPhone10,2" : "iPhone 8 Plus",
            "iPhone10,5" : "iPhone 8 Plus",
            "iPhone10,3" : "iPhone X",
            "iPhone10,6" : "iPhone X",
            "iPhone11,8"  : "iPhone XR",
            "iPhone11,2"  : "iPhone XS",
            "iPhone11,6"  : "iPhone XS Max",
            "iPhone12,1"  : "iPhone 11",
            "iPhone12,3"  : "iPhone 11 Pro",
            "iPhone12,5"  : "iPhone 11 Pro Max",
            "iPhone12,8"  : "iPhone SE 2nd",
            "iPhone13,1"  : "iPhone 12 mini",
            "iPhone13,2"  : "iPhone 12",
            "iPhone13,3"  : "iPhone 12 Pro",
            "iPhone13,4"  : "iPhone 12 Pro Max",
            "iPhone14,4"  : "iPhone 13 mini",
            "iPhone14,5"  : "iPhone 13",
            "iPhone14,2"  : "iPhone 13 Pro",
            "iPhone14,3"  : "iPhone 13 Pro Max",
            "iPhone14,7"  : "iPhone 14",
            "iPhone14,8"  : "iPhone 14 Plus",
            "iPhone15,2"  : "iPhone 14 Pro",
            "iPhone15,3"  : "iPhone 14 Pro Max",
            "iPhone15,4"  : "iPhone 15",
            "iPhone15,5"  : "iPhone 15 Plus",
            "iPhone16,1"  : "iPhone 15 Pro",
            "iPhone16,2"  : "iPhone 15 Pro Max",

            // iPad
            "iPad1,1": "iPad",
            "iPad2,1": "iPad 2nd",
            "iPad2,2": "iPad 2nd",
            "iPad2,3": "iPad 2nd",
            "iPad2,4": "iPad 2nd",
            "iPad2,5": "iPad Mini",
            "iPad2,6": "iPad Mini",
            "iPad2,7": "iPad Mini",
            "iPad3,1": "iPad 3rd",
            "iPad3,2": "iPad 3rd",
            "iPad3,3": "iPad 3rd",
            "iPad3,4": "iPad 4th",
            "iPad3,5": "iPad 4th",
            "iPad3,6": "iPad 4th",
            "iPad4,1": "iPad Air",
            "iPad4,2": "iPad Air",
            "iPad4,3": "iPad Air",
            "iPad4,4": "iPad mini 2nd",
            "iPad4,5": "iPad mini 2nd",
            "iPad4,6": "iPad mini 2nd",
            "iPad4,7": "iPad mini 3rd",
            "iPad4,8": "iPad mini 3rd",
            "iPad4,9": "iPad mini 3rd",
            "iPad5,1": "iPad Mini 4th",
            "iPad5,2": "iPad Mini 4th",
            "iPad5,3": "iPad Air 2nd",
            "iPad5,4": "iPad Air 2nd",
            "iPad6,3": "iPad Pro 9.7inch",
            "iPad6,4": "iPad Pro 9.7inch",
            "iPad6,7": "iPad Pro 12.9inch",
            "iPad6,8": "iPad Pro 12.9inch",
            "iPad6,11": "iPad 5th",
            "iPad6,12": "iPad 5th",
            "iPad7,1": "iPad Pro 12.9inch 2nd",
            "iPad7,2": "iPad Pro 12.9inch 2nd",
            "iPad7,3": "iPad Pro 10.5inch",
            "iPad7,4": "iPad Pro 10.5inch",
            "iPad7,5": "iPad 6th",
            "iPad7,6": "iPad 6th",
            "iPad7,11": "iPad 7th",
            "iPad7,12": "iPad 7th",
            "iPad8,1": "iPad Pro 11inch",
            "iPad8,2": "iPad Pro 11inch",
            "iPad8,3": "iPad Pro 11inch",
            "iPad8,4": "iPad Pro 11inch",
            "iPad8,5": "iPad Pro 12.9inch",
            "iPad8,6": "iPad Pro 12.9inch",
            "iPad8,7": "iPad Pro 12.9inch",
            "iPad8,8": "iPad Pro 12.9inch",
            "iPad8,9": "iPad Pro 11inch 2nd",
            "iPad8,10": "iPad Pro 11inch 2nd",
            "iPad8,11": "iPad Pro 12.9inch 4th",
            "iPad8,12": "iPad Pro 12.9inch 4th",
            "iPad11,1": "iPad mini 5th",
            "iPad11,2": "iPad mini 5th",
            "iPad11,3": "iPad Air 3rd",
            "iPad11,4": "iPad Air 3rd",
            "iPad11,6": "iPad 8th",
            "iPad11,7": "iPad 8th",
            "iPad13,1": "iPad Air 4th",
            "iPad13,2": "iPad Air 4th",
            "iPad13,4": "iPad Pro 11inch 3rd",
            "iPad13,5": "iPad Pro 11inch 3rd",
            "iPad13,6": "iPad Pro 11inch 3rd",
            "iPad13,7": "iPad Pro 11inch 3rd",
            "iPad13,8": "iPad Pro 12inch 5th",
            "iPad13,9": "iPad Pro 12inch 5th",
            "iPad13,10": "iPad Pro 12inch 5th",
            "iPad13,11": "iPad Pro 12inch 5th",
            "iPad14,1": "iPad mini 6th",
            "iPad14,2": "iPad mini 6th",
            "iPad12,1": "iPad 9th",
            "iPad12,2": "iPad 9th",
            "iPad13,16": "iPad Air 5th",
            "iPad13,17": "iPad Air 5th",
            "iPad13,18": "iPad 10th",
            "iPad13,19": "iPad 10th",
            "iPad14,3-A": "iPad Pro 11 inch 4th",
            "iPad14,3-B": "iPad Pro 11 inch 4th",
            "iPad14,4-A": "iPad Pro 11 inch 4th",
            "iPad14,4-B": "iPad Pro 11 inch 4th",
            "iPad14,5-A": "iPad Pro 12.9 inch 6th",
            "iPad14,5-B": "iPad Pro 12.9 inch 6th",
            "iPad14,6-A": "iPad Pro 12.9 inch 6th",
            "iPad14,6-B": "iPad Pro 12.9 inch 6th",

            // iPod touch
            "iPod1,1"   : "iPod touch",
            "iPod2,1"   : "iPod touch 2nd",
            "iPod3,1"   : "iPod touch 3rd",
            "iPod4,1"   : "iPod touch 4th",
            "iPod5,1"   : "iPod touch 5th",
            "iPod7,1"   : "iPod touch 6th",

            // Simulator
            "x86_64"    : "Simulator",
            "i386"      : "Simulator",
            "arm64"     : "Simulator"
    ]


}
