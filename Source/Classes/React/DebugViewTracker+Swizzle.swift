//
//  DebugViewTracker+Swizzle.swift
//  NowYouSeeReact
//
//  Created by Naveen Chaudhary on 19/09/20.
//

#if DEBUG
import Foundation
import NowYouSeeMe
import React

/**
 Swizzles methods on DebugViewTracker. lazy var so that it is called only once.
 - displayOverlay
 */
let swizzleDebugViewTrackerForReact: Void = {
    DebugViewTracker.swizzleMethod(originalSelector: #selector(DebugViewTracker.displayOverlay), swizzledSelector: #selector(DebugViewTracker.swizzled_displayOverlay))
}()

/**
 Extension on RCTView for swizzling methods
*/
extension DebugViewTracker {
    /**
     Convenience method to swizzle provided selectors
     - Parameters:
        - originalSelector: The original method
        - swizzledSelector: The new method to replace original method
    */
    fileprivate class func swizzleMethod(originalSelector: Selector, swizzledSelector: Selector) {
        guard let originalMethod = class_getInstanceMethod(Self.self, originalSelector), let swizzledMethod = class_getInstanceMethod(Self.self, swizzledSelector) else {
            return
        }
        // exchange implementations
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }

    /**
     Swizzled implementation of ```displayOverlay```
    */
    @objc dynamic fileprivate func swizzled_displayOverlay() {
        // RCTScrollView can have only 1 subview (it's scrollView)
        guard let view = view, !(view is RCTScrollView) else {
            return
        }

        // call original implementation
        self.swizzled_displayOverlay()
    }
}
#endif
