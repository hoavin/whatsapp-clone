//
//  ConversationViewController.h
//  WhatsApp
//
//  Created by Kevin Hoàng on 02.01.22.
//

#import <UIKit/UIKit.h>
#import "../../../Model/ModelData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConversationViewController : UITableViewController
@property (nonatomic, strong) WAContact *contact;
@end

NS_ASSUME_NONNULL_END
