//
//  ModelData.m
//  WhatsApp
//
//  Created by Kevin Hoàng on 31.12.21.
//

#import "ModelData.h"

@implementation ModelData

static WAModel *modelData;
+(WAModel * )modelData
{ @synchronized(self) { return modelData; } }
+ (void) setValue:(WAModel *)model
{ @synchronized(self) { modelData = model; } }


+ (void)load {
    NSString *path = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"json"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *err;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
    
    if (err) {
        NSAssert(NO, @"Failed to serialize JSON: %@", err);
    }
    
    WAModel *model = NSMutableArray.new;
    
    NSISO8601DateFormatter *formatter = NSISO8601DateFormatter.new;
    
    for(NSDictionary *dict in jsonArray) {
        WAContact *contact = WAContact.new;
        contact.name = dict[@"name"];
        contact.about = dict[@"about"];
        contact.profileImageName = dict[@"profileImageName"];
        
        NSMutableArray<WAMessage *> *messages = NSMutableArray.new;
        for(NSDictionary *messageDict in dict[@"messages"]) {
            WAMessage *message = WAMessage.new;
            message.content = messageDict[@"content"];
            
            NSDate *date = [formatter dateFromString:messageDict[@"date"]];
            message.date = date;
            
            message.messageDirection = [messageDict[@"messageDirection"] isEqual:@"incoming"] ? Incoming : Outgoing;
            
            [messages addObject:message];
        }
        
        NSSortDescriptor *sortDescriptor;
        sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"date" ascending:YES];
        [messages sortUsingDescriptors:@[sortDescriptor]];
        contact.messages = messages;
        
        NSMutableArray<WACall *> *calls = NSMutableArray.new;
        for(NSDictionary *callDict in dict[@"calls"]) {
            WACall *call = WACall.new;
            
            NSDate *date = [formatter dateFromString:callDict[@"date"]];
            call.date = date;
            
            call.callType = callDict[@"callType"] == @"Voice" ? Voice : Video;
            call.callDirection = [callDict[@"callDirection"] isEqual:@"incoming"] ? Incoming : Outgoing;
            call.isMissed = [callDict[@"missed"]isEqual:@"true"] ? YES : NO;
            [calls addObject:call];
        }
        
        [calls sortUsingDescriptors:@[sortDescriptor]];
        contact.calls = calls;
        
        [model addObject:contact];
    }
    
    
    NSMutableArray *sortedModel;
    sortedModel = [model sortedArrayUsingComparator:^NSComparisonResult(WAContact *a, WAContact *b) {
        NSDate *first = a.messages.lastObject.date;
        NSDate *second = b.messages.lastObject.date;

        return [second compare:first];
        
    }];
    modelData = sortedModel;
}
@end

@implementation WAContact
@end

@implementation WACall
@end

@implementation WAMessage
@end
