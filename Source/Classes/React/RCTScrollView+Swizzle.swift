//
//  RCTScrollView+Swizzle.swift
//  NowYouSeeReact
//
//  Created by Naveen Chaudhary on 21/09/20.
//

import Foundation
import React

/**
 Swizzles methods on RCTScrollView. lazy var so that it is called only once.
 - init(eventDispatcher:)
*/
let swizzleRCTScrollViewForTracking: Void = {
    RCTScrollView.swizzleMethod(originalSelector: #selector(RCTScrollView.init(eventDispatcher:)), swizzledSelector: #selector(RCTScrollView.init(swizzleEventDispatcher:)))
}()

/**
 Extension on RCTScrollView for swizzling methods
*/
extension RCTScrollView {
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
     Swizzled implementation of ```init(swizzleEventDispatcher:)```
    */
    @objc dynamic fileprivate convenience init(swizzleEventDispatcher: RCTEventDispatcher) {
        // call original implementation
        self.init(swizzleEventDispatcher: swizzleEventDispatcher)

        /**
         The scrollView of each RCTScrollView should be tracked, so that children are tracked on scroll.
         */
        scrollView?.trackView()
    }
}
