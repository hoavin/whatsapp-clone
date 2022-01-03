//
//  SettingsTableViewCell.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 29.12.21.
//

#import "SettingsTableViewCell.h"

@implementation SettingsTableViewCell

- (void)configureWithTitle:(NSString *)title withImage:(UIImage *)cellIcon {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.textLabel.text = title;
    self.imageView.image = cellIcon;
}

@end
