//
//  ViewController.h
//  WhatsApp
//
//  Created by Kevin Hoàng on 28.12.21.
//

#import <UIKit/UIKit.h>
#include "../Model/ModelData.h"

@interface MainTabBarController : UITabBarController
@property (nonatomic,strong) WAModel *model;
@end

