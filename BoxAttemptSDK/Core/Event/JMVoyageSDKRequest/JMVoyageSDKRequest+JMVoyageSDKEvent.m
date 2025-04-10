//
//  JMVoyageSDKRequest+JMVoyageSDKEvent.m
//  JMVoyageSDK
//
//  Created by Thief Toki on 2021/1/20.
//

#import "JMVoyageSDKRequest+JMVoyageSDKEvent.h"

#import "JMVoyageSDKInfo.h"

#import "JMVoyageSDKEventItem.h"

@implementation JMVoyageSDKRequest (JMVoyageSDKEvent)

- (void)uploadEvents:(NSArray <JMVoyageSDKEventItem *>*)events
            callback:(JMRequestCallback)callback {
    NSString *path = @"/client/data";
    NSMutableArray *eventDatas = [NSMutableArray array];
    for (JMVoyageSDKEventItem *event in events) {
        NSMutableDictionary *eventData = [event.jsonValue mutableCopy];
        [eventData addEntriesFromDictionary:@{
            @"model": [JMVoyageSDKInfo shared].model?:@"",
            @"resolution": [[JMVoyageSDKInfo shared] resolution]?:@"",
            @"source": @"none",
            @"uploadTime": [JMVoyageSDKInfo shared].timestamp?:@"",
            @"version": [JMVoyageSDKInfo shared].version?:@"",
            @"idfa": [JMVoyageSDKInfo shared].IDFA?:@"",
            @"uuid": [JMVoyageSDKInfo shared].UID?:@"",
            @"uniqueId": [JMVoyageSDKInfo shared].uniqueId?:@"",
        }];
        [eventDatas addObject:[eventData copy]];
    }
    NSDictionary *parameters = @{
        @"data": [eventDatas copy]
    };
    [self requestDataWithMethod:JMRequestMethodType_POST_JSON
                           path:path
                     parameters:parameters
                       callback:callback];
}

@end
