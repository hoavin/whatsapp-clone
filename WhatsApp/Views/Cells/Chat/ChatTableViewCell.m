//
//  ChatTableViewCell.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 01.01.22.
//

#import "ChatTableViewCell.h"

@interface ChatTableViewCell ()

@property (nonatomic, strong)WAContact *contact;
@property (nonatomic, strong) UIImageView *profileImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *dateLabel;

- (void)configureProfileImageView;

- (void)configureNameLabel;

- (void)configureMessageLabel;

-(void)configureDateLabel;

@end

@implementation ChatTableViewCell

- (void)configureWithContact:(WAContact *)contact {
    self.contact = contact;
    [self configureProfileImageView];
    [self configureNameLabel];
    [self configureDateLabel];
    [self configureMessageLabel];
}

- (void)configureProfileImageView {
    self.profileImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.profileImageView.layer.masksToBounds = YES;
    self.profileImageView.layer.cornerRadius = 25;
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    UIImage *image = [UIImage imageNamed:self.contact.profileImageName];
    self.profileImageView.image = image;
    
    [self addSubview:self.profileImageView];
    
    [self.profileImageView.leadingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leadingAnchor].active = YES;
    [self.profileImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor].active = YES;
    [self.profileImageView.widthAnchor constraintEqualToConstant:50].active = YES;
    [self.profileImageView.heightAnchor constraintEqualToConstant:50].active = YES;
}

- (void)configureNameLabel {
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameLabel.text = self.contact.name;
    self.nameLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightSemibold];
    
    [self addSubview:self.nameLabel];
    
    [self.nameLabel.topAnchor constraintEqualToAnchor:self.profileImageView.topAnchor].active = YES;
    [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.profileImageView.trailingAnchor constant:15].active = YES;
}

- (void)configureDateLabel {
    self.dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSDate *date = self.contact.messages.lastObject.date;
    NSString *dateString;
    
    if ([NSCalendar.currentCalendar isDate:date inSameDayAsDate:NSDate.now]) {
        dateString = [NSDateFormatter localizedStringFromDate:date dateStyle:nil timeStyle:NSDateFormatterShortStyle];
    } else {
        dateString = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterShortStyle timeStyle:nil];

    }
    
    self.dateLabel.text = dateString;
    self.dateLabel.textColor = [UIColor secondaryLabelColor];
    
    [self addSubview:self.dateLabel];
    
    [self.dateLabel.topAnchor constraintEqualToAnchor:self.nameLabel.topAnchor].active = YES;
    [self.dateLabel.trailingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.trailingAnchor].active = YES;
}

- (void)configureMessageLabel {
    self.messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.messageLabel.text = self.contact.messages.lastObject.content;
    self.messageLabel.textColor = [UIColor secondaryLabelColor];
    
    [self addSubview:self.messageLabel];
    
    [self.messageLabel.topAnchor constraintEqualToAnchor:self.nameLabel.bottomAnchor].active = YES;
    [self.messageLabel.bottomAnchor constraintEqualToAnchor:self.layoutMarginsGuide.bottomAnchor].active = YES;
    [self.messageLabel.leadingAnchor constraintEqualToAnchor:self.nameLabel.leadingAnchor].active = YES;
    [self.messageLabel.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-100].active = YES;
    
}

- (instancetype)init {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChatCell"];
    if(self) {
        _profileImageView = UIImageView.new;
        _nameLabel = UILabel.new;
        _messageLabel = UILabel.new;
        _dateLabel = UILabel.new;
    }
    return self;
}
@end
