//
//  RCTView+Swizzle.swift
//  NowYouSeeReact
//
//  Created by Naveen Chaudhary on 19/09/20.
//

import Foundation
import React

/**
 Swizzles methods on RCTView. lazy var so that it is called only once.
 - init(frame:)
*/
let swizzleRCTViewForTracking: Void = {
    RCTView.swizzleMethod(originalSelector: #selector(RCTView.init(frame:)), swizzledSelector: #selector(RCTView.init(swizzleFrame:)))
}()

/**
 Extension on RCTView for swizzling methods
*/
extension RCTView {
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
     Swizzled implementation of ```init(frame:)```
    */
    @objc dynamic fileprivate convenience init(swizzleFrame: CGRect) {
        // call original implementation
        self.init(swizzleFrame: swizzleFrame)

        /**
         Each RCTView should be tracked.
         We do not have Cell class in React equivalent to UITableViewCell / UICollectionVewCell.
         Hence, we are unable to identify if an RCTView is recycled / reused.
         */
        trackView()
        
//        if let reactScrollView: RCTScrollView = self as? RCTScrollView {
//            reactScrollView.scrollView?.trackView()
//        }
    }
}
