//
//  ProfileTableViewCell.h
//  WhatsApp
//
//  Created by Kevin Hoàng on 29.12.21.
//

#import <UIKit/UIKit.h>
#import "../../../Model/Profile/Profile.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileTableViewCell : UITableViewCell
- (void)configureWithProfile:(Profile *)profile;
@end

NS_ASSUME_NONNULL_END
