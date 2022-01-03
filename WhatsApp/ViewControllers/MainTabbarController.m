//
//  ViewController.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 28.12.21.
//

#import "MainTabBarController.h"
#import "Status/StatusViewController.h"
#import "Calls/CallsViewController.h"
#import "Camera/CameraViewController.h"
#import "Chat/ChatViewController.h"
#import "Settings/SettingsViewController.h"

@interface MainTabBarController ()

- (void)configureTabBar;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureTabBar];
}

- (void)configureTabBar {
    UINavigationController *statusVC = [[UINavigationController alloc]initWithRootViewController:StatusViewController.new];
    UINavigationController *callsVC = [[UINavigationController alloc]initWithRootViewController:CallsViewController.new];
    UINavigationController *cameraVC = [[UINavigationController alloc]initWithRootViewController:CameraViewController.new];
    ChatViewController *chatVC = ChatViewController.new;
    UINavigationController *chatVCNC = [[UINavigationController alloc]initWithRootViewController:chatVC];
    SettingsViewController *settingsVC = [[SettingsViewController alloc]initWithStyle:UITableViewStyleGrouped];
    UINavigationController *settingsVCNC = [[UINavigationController alloc]initWithRootViewController:settingsVC];
    
    statusVC.title = @"Status";
    statusVC.tabBarItem.image = [UIImage systemImageNamed:@"circle.dashed"];
    
    callsVC.title = @"Calls";
    callsVC.tabBarItem.image = [UIImage systemImageNamed:@"phone"];
    
    cameraVC.title = @"Camera";
    cameraVC.tabBarItem.image = [UIImage systemImageNamed:@"camera"];
    
    chatVC.title = @"Chats";
    chatVC.tabBarItem.image = [UIImage systemImageNamed:@"message"];
    
    settingsVCNC.title = @"Settings";
    settingsVCNC.tabBarItem.image = [UIImage systemImageNamed:@"gear"];
        
    NSArray *controllers = @[statusVC, callsVC, cameraVC, chatVCNC, settingsVCNC];
    [self setViewControllers:controllers];
    
    self.selectedIndex = 3;
    
    self.tabBarController.tabBar.tintColor = [UIColor systemBlueColor];
}
@end
