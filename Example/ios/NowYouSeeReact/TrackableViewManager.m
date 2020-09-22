//
//  TrackableViewManager.m
//  NowYouSeeReact-Demo
//
//  Created by Naveen Chaudhary on 21/09/20.
//  Copyright © 2020 Flipkart. All rights reserved.
//

#import "TrackableViewManager.h"
#import "NowYouSeeReact_Demo-Swift.h"

@implementation TrackableViewManager

RCT_EXPORT_MODULE(TrackableView);

+ (BOOL)requiresMainQueueSetup {
	return NO;
}

- (UIView *)view {
	TrackableView *view =  [[TrackableView alloc] init];
	return view;
}

@end
