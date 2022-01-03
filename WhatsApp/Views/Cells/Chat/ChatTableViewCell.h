//
//  ChatTableViewCell.h
//  WhatsApp
//
//  Created by Kevin Hoàng on 01.01.22.
//

#import <UIKit/UIKit.h>
#include "../../../Model/ModelData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChatTableViewCell : UITableViewCell
- (void)configureWithContact:(WAContact *)contact;
@end

NS_ASSUME_NONNULL_END
