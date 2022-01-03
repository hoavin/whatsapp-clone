//
//  ChatBubbleTableViewCell.h
//  WhatsApp
//
//  Created by Kevin Hoàng on 03.01.22.
//

#import <UIKit/UIKit.h>
#import "../../../Model/ModelData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatBubbleTableViewCell : UITableViewCell
@property (nonatomic, strong)NSString *message;

- (void)configureWithMessage:(WAMessage *)message;
@end

NS_ASSUME_NONNULL_END
