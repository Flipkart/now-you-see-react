//
//  NowYouSeeReact.swift
//  NowYouSeeReact
//
//  Created by Naveen Chaudhary on 19/09/20.
//

import Foundation
import NowYouSeeMe

/**
 Extension on NowYou(SeeMe) for adding react support
 */
extension NowYou {
    /**
     Enables view tracking for react views
     
     This method should be called after the app is launched and before starting view tracking.
     
     - Important: Calling this method is important if you are dealing with recyclable React Native views
    */
    @objc public static func seeReact() {
        // enable parent framework
        NowYou.seeMe()

        // start swizzling
        _ = swizzleRCTViewForTracking
        _ = swizzleRCTScrollViewForTracking

        #if DEBUG
        // swizzle debug tracker in debug mode
        _ = swizzleDebugViewTrackerForReact
        #endif
    }
}
