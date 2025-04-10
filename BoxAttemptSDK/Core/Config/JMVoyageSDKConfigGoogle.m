//
//  JMVoyageSDKConfigGoogle.m
//  JMVoyageSDKBase
//
//  Created by ZhengXianda on 1/9/23.
//

#import "JMVoyageSDKConfigGoogle.h"

#import <JMUtils/JMUtils.h>

@implementation JMVoyageSDKConfigGoogle

- (instancetype)initWithData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        if (![data isKindOfClass:[NSDictionary class]]) {
            JMLog(@"Config Google 信息异常: %@", data);
        } else {
            self.clientId = data[@"clientId"]?:@"";
        }
    }
    return self;
}

- (BOOL)isValid {
    return
    self.clientId.length;
}


@end
