//
//  ProfileTableViewCell.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 29.12.21.
//

#import "ProfileTableViewCell.h"

@interface ProfileTableViewCell ()

@property (nonatomic, strong) Profile *profile;
@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *aboutLabel;
@property (nonatomic, strong) UIButton *qrCodeButton;

-(void)configureImageView;

-(void)configreNameLabel;

-(void)configureAboutLabel;

-(void)configureQrCodeButton;

@end

@implementation ProfileTableViewCell

- (void)configureWithProfile:(Profile *)profile {
    self.profile = profile;
    [self configureImageView];
    [self configreNameLabel];
    [self configureAboutLabel];
    [self configureQrCodeButton];
}

- (void)configureImageView {
    self.profileImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.profileImageView.layer.masksToBounds = YES;
    self.profileImageView.layer.cornerRadius = 25;
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    UIImage *image = [UIImage imageNamed:self.profile.imageName];
    self.profileImageView.image = image;
    
    [self addSubview:self.profileImageView];
    
    [self.profileImageView.leadingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leadingAnchor].active = YES;
    [self.profileImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    [self.profileImageView.widthAnchor constraintEqualToConstant:50].active = YES;
    [self.profileImageView.heightAnchor constraintEqualToConstant:50].active = YES;
}

- (void)configreNameLabel {
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.text = self.profile.name;
    self.nameLabel.font = [UIFont systemFontOfSize:22];
    
    [self addSubview:self.nameLabel];

//    [self.nameLabel.topAnchor constraintEqualToAnchor:self.profileImageView.topAnchor].active = YES;
    [self.nameLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:-10].active = YES;
    [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.profileImageView.trailingAnchor constant:20].active = YES;
}

- (void)configureAboutLabel {
    self.aboutLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.aboutLabel.text = self.profile.about;
    self.aboutLabel.font = [UIFont systemFontOfSize:17];
    self.aboutLabel.textColor = [UIColor secondaryLabelColor];
    
    [self addSubview:self.aboutLabel];
    
    [self.aboutLabel.leadingAnchor constraintEqualToAnchor:self.nameLabel.leadingAnchor].active = YES;
//    [self.aboutLabel.bottomAnchor constraintEqualToAnchor:self.profileImageView.bottomAnchor].active = YES;
    NSLayoutConstraint *verticalSpacing = [NSLayoutConstraint constraintWithItem:self.nameLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.aboutLabel attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    verticalSpacing.active = YES;
}

- (void)configureQrCodeButton {
    self.qrCodeButton.translatesAutoresizingMaskIntoConstraints = NO;
    UIImage *icon = [UIImage systemImageNamed:@"qrcode" withConfiguration:[UIImageSymbolConfiguration configurationWithFont:[UIFont systemFontOfSize:20]]];
    [self.qrCodeButton setImage:icon forState:UIControlStateNormal];
    self.qrCodeButton.backgroundColor = [UIColor systemFillColor];
    self.qrCodeButton.layer.cornerRadius = 22;
    
    [self addSubview:self.qrCodeButton];
    
    [self.qrCodeButton.trailingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.trailingAnchor].active = YES;
    [self.qrCodeButton.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    [self.qrCodeButton.widthAnchor constraintEqualToConstant:44].active = YES;
    [self.qrCodeButton.heightAnchor constraintEqualToConstant:44].active = YES;
}

- (instancetype)init
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProfileCell"];
    if (self) {
        _profileImageView = UIImageView.new;
        _nameLabel = UILabel.new;
        _aboutLabel = UILabel.new;
        _qrCodeButton = UIButton.new;
    }
    return self;
}
@end
