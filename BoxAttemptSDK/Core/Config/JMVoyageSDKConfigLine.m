//
//  JMVoyageSDKConfigLine.m
//  JMVoyageSDKBase
//
//  Created by ZhengXianda on 1/9/23.
//

#import "JMVoyageSDKConfigLine.h"

#import <JMUtils/JMUtils.h>

@implementation JMVoyageSDKConfigLine

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        if (![data isKindOfClass:[NSDictionary class]]) {
            JMLog(@"Config Line 信息异常: %@", data);
        } else {
            self.channelId = data[@"channelId"]?:@"";
            self.universalLink = data[@"universalLink"]?:@"";
            
            if (![self.universalLink hasPrefix:@"https"]) {
                self.universalLink = nil;
            }
        }
    }
    return self;
}

- (BOOL)isValid {
    return
    self.channelId.length;
}


@end
