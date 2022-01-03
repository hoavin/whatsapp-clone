//
//  Profile.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 29.12.21.
//

#import "Profile.h"

@interface Profile ()

@end

@implementation Profile

+ (instancetype)sampleProfile {
    static Profile *sharedInstance;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Profile alloc] initWithName:@"Kevin" about:@"Junior iOS Engineer" imageName:@"profilePicture"];
    });

    return sharedInstance;
}

- (instancetype)initWithName:(NSString *)name about:(NSString *)about imageName:(NSString *)imageName {
    self = [super init];
    if (self) {
        _name = name;
        _about = about;
        _imageName = imageName;
    }
    return self;
}

@end
