//
//  Device.swift
//  LetsEat
//
//  Created by iOS 15 Programming on 14/12/2021.
//

import UIKit
enum Device {
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    static var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
