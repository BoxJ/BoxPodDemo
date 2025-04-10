//
//  JMVoyageSDKBusiness.m
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import "JMVoyageSDKBusiness.h"

@implementation JMVoyageSDKBusiness

#pragma mark - shared

+ (JMVoyageSDKBusiness *)shared {
    static JMVoyageSDKBusiness *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JMVoyageSDKBusiness alloc] init];
    });
    return instance;
}

+ (JMVoyageSDKConfig *)config{
    return [JMVoyageSDKConfig shared];
}

+ (JMVoyageSDKInfo *)info{
    return [JMVoyageSDKInfo shared];
}

+ (JMVoyageSDKRequest *)request {
    return [JMVoyageSDKRequest shared];
}

+ (JMVoyageSDKWeb *)web {
    return [[JMVoyageSDKWeb alloc] init];
}

+ (JMVoyageSDKEvent *)event {
    return [JMVoyageSDKEvent shared];
}

+ (JMVoyageSDKFlyer *)flyer {
    return [JMVoyageSDKFlyer shared];
}

+ (JMVoyageSDKRisk *)risk {
    return [JMVoyageSDKRisk shared];
}

@end
