//
//  JMVoyageSDKConfigFacebook.m
//  JMVoyageSDKBase
//
//  Created by ZhengXianda on 1/9/23.
//

#import "JMVoyageSDKConfigFacebook.h"

#import <JMUtils/JMUtils.h>

@implementation JMVoyageSDKConfigFacebook

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        if (![data isKindOfClass:[NSDictionary class]]) {
            JMLog(@"Config Facebook 信息异常: %@", data);
        } else {
            self.clientId = data[@"clientId"]?:@"";
            self.clientToken = data[@"clientToken"]?:@"";
            self.displayName = data[@"displayName"]?:@"";
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
    self.clientId.length > 0 &&
    self.clientToken.length > 0;
}

@end
