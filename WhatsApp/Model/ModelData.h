//
//  ModelData.h
//  WhatsApp
//
//  Created by Kevin Hoàng on 31.12.21.
//

#import <Foundation/Foundation.h>

@class WAContact;
@class WACall;
@class WAMessage;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

typedef enum : NSUInteger {
    Incoming,
    Outgoing,
} WADirection;

typedef enum : NSUInteger {
    Voice,
    Video,
} WACallType;
#pragma mark - Object interfaces

@interface ModelData : NSObject
typedef NSMutableArray<WAContact *> WAModel;
+ (WAModel *)modelData;
+ (void)load;
@end

@interface WAContact : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *about;
@property (nonatomic, copy) NSString *profileImageName;
@property (nonatomic, copy) NSMutableArray<WAMessage *> *messages;
@property (nonatomic, copy) NSMutableArray<WACall *> *calls;
@end

@interface WACall : NSObject
@property (nonatomic, copy)   NSDate *date;
@property (nonatomic, assign) WACallType *callType;
@property (nonatomic, assign) WADirection *callDirection;
@property (nonatomic, assign) BOOL isMissed;

@end

@interface WAMessage : NSObject
@property (nonatomic, copy)   NSString *content;
@property (nonatomic, copy)   NSDate *date;
@property (nonatomic, assign) WADirection *messageDirection;
@end

NS_ASSUME_NONNULL_END
