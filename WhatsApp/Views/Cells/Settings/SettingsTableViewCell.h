//
//  SettingsTableViewCell.h
//  WhatsApp
//
//  Created by Kevin Hoàng on 29.12.21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsTableViewCell : UITableViewCell
-(void)configureWithTitle:(NSString *)title withImage:(UIImage *)cellIcon;
@end

NS_ASSUME_NONNULL_END
