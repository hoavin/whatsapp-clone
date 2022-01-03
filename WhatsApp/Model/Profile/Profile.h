//
//  Profile.h
//  WhatsApp
//
//  Created by Kevin Hoàng on 29.12.21.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *about;
@property (nonatomic) NSString *imageName;

+ (instancetype)sampleProfile;

- (instancetype)initWithName:(NSString *)name about:(NSString *)about imageName:(NSString *)imageName;

@end
