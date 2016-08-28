//
//  AppDelegate.m
//  DoctorCare365
//
//  Created by ios on 16/7/27.
//  Copyright © 2016年 ios. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeTableViewController.h"
#import "LeftTableViewController.h"
#import "DCNavigationController.h"
#import "LoginedLeftTabController.h"

#import <SMS_SDK/SMSSDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [SMSSDK registerApp:@"1597095994119" withSecret:@"44639f7a727331f6a5dffa124e1eadce"];
  
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    HomeTableViewController *centerVC = [[HomeTableViewController alloc] init];
    DCNavigationController *navCenter = [[DCNavigationController alloc] initWithRootViewController:centerVC];
    
    //判断是否登录
    BOOL isLogined = [[NSUserDefaults standardUserDefaults] boolForKey:@"isLogined"];

    if (isLogined == YES)
    {
        LoginedLeftTabController *loginedLeftVC = [[LoginedLeftTabController alloc] init];
        
        MMDrawerController *rootVc = [[MMDrawerController alloc] initWithCenterViewController:navCenter leftDrawerViewController:loginedLeftVC];
        //  打开手势
        
    
        rootVc.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
        //  关闭手势
        rootVc.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
        
        self.window.rootViewController = rootVc;
    }
    else
    {
        LeftTableViewController *leftVC = [[LeftTableViewController alloc] init];
        
        MMDrawerController *rootVc = [[MMDrawerController alloc] initWithCenterViewController:navCenter leftDrawerViewController:leftVC];
        //  打开手势
        rootVc.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
        //  关闭手势
        rootVc.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
        
        self.window.rootViewController = rootVc;
        
        
    }
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
