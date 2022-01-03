//
//  AppDelegate.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 28.12.21.
//

#import "AppDelegate.h"
#import "ViewControllers/MainTabBarController.h"
#import "Model/ModelData.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    [ModelData load];
    MainTabBarController *controller = [[MainTabBarController alloc]init];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
