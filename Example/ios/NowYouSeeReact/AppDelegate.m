//
//  AppDelegate.m
//  NowYouSeeReact-Demo
//
//  Created by Naveen Chaudhary on 21/09/20.
//  Copyright © 2020 Flipkart. All rights reserved.
//

#import "AppDelegate.h"

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

#ifdef FB_SONARKIT_ENABLED
#import <FlipperKit/FlipperClient.h>
#import <FlipperKitLayoutPlugin/FlipperKitLayoutPlugin.h>
#import <FlipperKitUserDefaultsPlugin/FKUserDefaultsPlugin.h>
#import <FlipperKitNetworkPlugin/FlipperKitNetworkPlugin.h>
#import <SKIOSNetworkPlugin/SKIOSNetworkAdapter.h>
#import <FlipperKitReactPlugin/FlipperKitReactPlugin.h>
#import "NowYouSeeReact_Demo-Swift.h"

static void InitializeFlipper(UIApplication *application) {
	FlipperClient *client = [FlipperClient sharedClient];
	SKDescriptorMapper *layoutDescriptorMapper = [[SKDescriptorMapper alloc] initWithDefaults];
	[client addPlugin:[[FlipperKitLayoutPlugin alloc] initWithRootNode:application withDescriptorMapper:layoutDescriptorMapper]];
	[client addPlugin:[[FKUserDefaultsPlugin alloc] initWithSuiteName:nil]];
	[client addPlugin:[FlipperKitReactPlugin new]];
	[client addPlugin:[[FlipperKitNetworkPlugin alloc] initWithNetworkAdapter:[SKIOSNetworkAdapter new]]];
	[client start];
}
#endif

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
#ifdef FB_SONARKIT_ENABLED
	InitializeFlipper(application);
#endif
	
	RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
	RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
													 moduleName:@"NowYouSeeReact"
											  initialProperties:nil];
	
	rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
	
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	ViewController *rootViewController = [ViewController new];
	rootViewController.view = rootView;
	self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
	[self.window makeKeyAndVisible];
	
	[LaunchTasks perform];
	[rootViewController setupUI];
	return YES;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
	return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
	return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
