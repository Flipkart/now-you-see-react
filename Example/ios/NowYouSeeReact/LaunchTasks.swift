//
//  LaunchTasks.swift
//  NowYouSeeReact-Demo
//
//  Created by Naveen Chaudhary on 21/09/20.
//  Copyright © 2020 Flipkart. All rights reserved.
//

import Foundation
import NowYouSeeMe
import NowYouSeeReact
import GDPerformanceView_Swift

@objc class LaunchTasks: NSObject {
    @objc static func perform() {
        // enable tracking
        NowYou.seeReact()
        
        // start performance monitoring
        PerformanceMonitor.shared().start()
    }
}
