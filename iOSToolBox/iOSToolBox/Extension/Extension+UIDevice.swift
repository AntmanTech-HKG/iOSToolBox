//
//  Extension+UIDevice.swift
//
//  Created by Anthony on 2/2/2018.
//  Copyright © 2017-Present AntmanTech. All rights reserved.
//

import UIKit

public extension UIDevice {

    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }

    enum LayoutStyle: String {
        case iPadFullScreen = "iPad Full Screen"
        case iPadHalfScreen = "iPad 1/2 Screen"
        case iPadTwoThirdScreeen = "iPad 2/3 Screen"
        case iPadOneThirdScreen = "iPad 1/3 Screen"
        case iPhoneFullScreen = "iPhone"
    }

    private func deviceOrientation () -> UIDeviceOrientation {
        return orientation
    }

    private func getScreenSize () -> (description: String, size: CGRect) {
        let size = UIScreen.main.bounds
        let str = "SCREEN SIZE:\nwidth: \(size.width)\nheight: \(size.height)"
        return (str, size)
    }

    private func getApplicationSize() -> (description: String, size: CGRect) {
        let size = UIApplication.shared.windows[0].bounds
        let str = "\n\nAPPLICATION SIZE:\nwidth: \(size.width)\nheight: \(size.height)"
        return (str, size)
    }

    func currentLayout() -> LayoutStyle {
//        guard iPhone else { return .iPhoneFullScreen }

        let screenSize = getScreenSize().size
        let appSize = getApplicationSize().size
        let screenWidth = screenSize.width
        let appWidth = appSize.width
        if screenSize == appSize {
            return .iPadFullScreen
        }

        // Set a range in case there is some mathematical inconsistency or other outside influence that results in the application width being less than exactly 1/3, 1/2 or 2/3.
        let lowRange = screenWidth - 15
        let highRange = screenWidth + 15

        if lowRange / 2 <= appWidth && appWidth <= highRange / 2 {
            return .iPadHalfScreen
        } else if appWidth <= highRange / 3 {
            return .iPadOneThirdScreen
        } else {
            return .iPadTwoThirdScreeen
        }

    }
    func currentOrientation() -> Bool {
        // return true if landscape
        return UIApplication.shared.statusBarOrientation == .landscapeLeft || UIApplication.shared.statusBarOrientation == .landscapeRight
    }

    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case Unknown
    }

    var screenType: ScreenType {
//        guard iPhone else { return .Unknown}
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 2208:
            return .iPhone6Plus
        case 2436:
            return .iPhoneX
        default:
            return .Unknown
        }
    }

    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }

        #if os(iOS)
            switch identifier {
            case "iPod5,1": return "iPod Touch 5"
            case "iPod7,1": return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3": return "iPhone 4"
            case "iPhone4,1": return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2": return "iPhone 5"
            case "iPhone5,3", "iPhone5,4": return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2": return "iPhone 5s"
            case "iPhone7,2": return "iPhone 6"
            case "iPhone7,1": return "iPhone 6 Plus"
            case "iPhone8,1": return "iPhone 6s"
            case "iPhone8,2": return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3": return "iPhone 7"
            case "iPhone9,2", "iPhone9,4": return "iPhone 7 Plus"
            case "iPhone8,4": return "iPhone SE"
            case "iPhone10,1", "iPhone10,4": return "iPhone 8"
            case "iPhone10,2", "iPhone10,5": return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6": return "iPhone X"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3": return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6": return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3": return "iPad Air"
            case "iPad5,3", "iPad5,4": return "iPad Air 2"
            case "iPad6,11", "iPad6,12": return "iPad 5"
            case "iPad7,5", "iPad7,6": return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7": return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6": return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9": return "iPad Mini 3"
            case "iPad5,1", "iPad5,2": return "iPad Mini 4"
            case "iPad6,3", "iPad6,4": return "iPad Pro 9.7 Inch"
            case "iPad6,7", "iPad6,8": return "iPad Pro 12.9 Inch"
            case "iPad7,1", "iPad7,2": return "iPad Pro 12.9 Inch 2. Generation"
            case "iPad7,3", "iPad7,4": return "iPad Pro 10.5 Inch"
            case "AppleTV5,3": return "Apple TV"
            case "AppleTV6,2": return "Apple TV 4K"
            case "AudioAccessory1,1": return "HomePod"
            case "i386", "x86_64": return "Simulator"
            default: return identifier
            }
        #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
        #endif
    }
}
