//
//  TrackableView.swift
//  NowYouSeeReact-Demo
//
//  Created by Naveen Chaudhary on 21/09/20.
//  Copyright © 2020 Flipkart. All rights reserved.
//

import Foundation
import React
import NowYouSeeMe

@objc class TrackableView: RCTView {
	override init(frame: CGRect) {
		super.init(frame: frame)

		self.backgroundColor = .blue
		self.trackView(self, conditions: conditions(self))
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func conditions(_ view: UIView) -> [ViewCondition] {
		var conditions = [ViewCondition]()
		conditions.append(ScrollIdle(view))
		conditions.append(Viewability(view))
		conditions.append(Tracking(view))
		return conditions
	}
}

extension TrackableView: ViewabilityListener {
	func viewStarted(_ view: UIView) {
		self.backgroundColor = .green
	}
	
	func viewEnded(_ view: UIView, maxPercentage: Float) {
		self.backgroundColor = .red
	}
}
