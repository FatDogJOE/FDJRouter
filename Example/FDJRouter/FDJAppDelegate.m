//
//  FDJAppDelegate.m
//  FDJRouter
//
//  Created by likethephoenix@163.com on 10/30/2019.
//  Copyright (c) 2019 likethephoenix@163.com. All rights reserved.
//

#import "FDJAppDelegate.h"
#import "VC1Controller.h"
#import "VC2Controller.h"
#import "VC3Controller.h"
#import "VC4Controller.h"
#import "VC5Controller.h"
#import "VC6Controller.h"
#import "VC7Controller.h"
#import "VC8Controller.h"
#import "VC9Controller.h"
#import "FDJRouter.h"

@implementation FDJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[FDJRouter instance] registerDomain:@"domain1"];
    [[FDJRouter instance] registerDomain:@"domain2"];
    [[FDJRouter instance] registerDomain:@"domain3"];
    // Override point for customization after application launch.
    
    [[FDJRouter instance] registerPath:@"/path1" forClass:VC1Controller.class];
    [[FDJRouter instance] registerPath:@"/path1/path2" forClass:VC2Controller.class];
    [[FDJRouter instance] registerPath:@"/path1/path2/path3" forClass:VC3Controller.class];
    
    [[FDJRouter instance] registerPath:@"/path4" forClass:VC4Controller.class];
    [[FDJRouter instance] registerPath:@"/path4/path5" forClass:VC5Controller.class];
    [[FDJRouter instance] registerPath:@"/path4/path5/path6" forClass:VC6Controller.class];
    
    [[FDJRouter instance] registerPath:@"/path7" forClass:VC7Controller.class];
    [[FDJRouter instance] registerPath:@"/path7/path8" forClass:VC8Controller.class];
    [[FDJRouter instance] registerPath:@"/path7/path8/path9" forClass:VC9Controller.class];
    
    [[FDJRouter instance] setupRootPages:@[@"router://domain1/path1",@"router://domain2/path4",@"router://domain3/path7"]];
    
    self.window.rootViewController = [FDJRouter instance].tabBarController;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
