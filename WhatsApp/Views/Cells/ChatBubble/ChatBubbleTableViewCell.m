//
//  ChatBubbleTableViewCell.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 03.01.22.
//

#import "ChatBubbleTableViewCell.h"

@interface ChatBubbleTableViewCell ()

@property (nonatomic,strong) UIView *messageBackgroundView;
@property (nonatomic, strong) UILabel *messageLabel;

- (void)configureIncomingMessage;
- (void)configureOutgoingMessage;
@end

@implementation ChatBubbleTableViewCell

- (void)configureIncomingMessage {
    self.messageBackgroundView.backgroundColor = [UIColor lightGrayColor];
    [self.messageBackgroundView.leadingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.leadingAnchor].active = YES;
}

- (void)configureOutgoingMessage {
    self.messageBackgroundView.backgroundColor = [UIColor systemGreenColor];
    [self.messageBackgroundView.trailingAnchor constraintEqualToAnchor:self.layoutMarginsGuide.trailingAnchor].active = YES;

}

- (void)configureWithMessage:(WAMessage *)message {
    self.messageBackgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    self.messageBackgroundView.layer.cornerRadius = 10;
    
    [self addSubview:self.messageBackgroundView];
    
    [self.messageBackgroundView.topAnchor constraintEqualToAnchor:self.layoutMarginsGuide.topAnchor].active = YES;
    [self.messageBackgroundView.bottomAnchor constraintEqualToAnchor:self.layoutMarginsGuide.bottomAnchor].active = YES;
    [self.messageBackgroundView.widthAnchor constraintLessThanOrEqualToConstant:300].active = YES;
    
    self.messageLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.messageLabel.text = message.content;
    self.messageLabel.numberOfLines = 0;
    [self.messageBackgroundView addSubview:self.messageLabel];
    
    CGFloat inset = 10;
    [self.messageLabel.topAnchor constraintEqualToAnchor:self.messageBackgroundView.topAnchor constant:inset].active = YES;
    [self.messageLabel.leadingAnchor constraintEqualToAnchor:self.messageBackgroundView.leadingAnchor constant:inset].active = YES;
    [self.messageLabel.trailingAnchor constraintEqualToAnchor:self.messageBackgroundView.trailingAnchor constant:-inset].active = YES;
    [self.messageLabel.bottomAnchor constraintEqualToAnchor:self.messageBackgroundView.bottomAnchor constant:-inset].active = YES;

    
    if(message.messageDirection == Incoming) {
        [self configureIncomingMessage];
    } else {
        [self configureOutgoingMessage];

    }
}

- (void)layoutMarginsDidChange {
    self.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
}

- (instancetype)init {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MessageBubbleCell"];
    if(self) {
        _messageBackgroundView = UIView.new;
        _messageLabel = UILabel.new;
    }
    return self;
}

@end
