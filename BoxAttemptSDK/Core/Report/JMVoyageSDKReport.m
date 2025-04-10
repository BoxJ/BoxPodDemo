//
//  JMVoyageSDKReport.m
//  JMVoyageSDKReport
//
//  Created by ZhengXianda on 08/04/2021.
//  Copyright (c) 2021 ZhengXianda. All rights reserved.
//

#import "JMVoyageSDKReport.h"

#import <JMRktCommon/JMRktCommon.h>

#import "JMVoyageSDKEvent.h"
#import "JMVoyageSDKResource.h"

@implementation NSError (JMVoyageSDKReport)

+ (instancetype)voyage_common:(NSString *)message {
    return [NSError voyage_reportWithCode:JMVoyageSDKReportCode_Common message:message];
}

+ (instancetype)voyage_reportWithCode:(NSInteger)code message:(NSString *)message {
    NSError *report = [JMRktResponse errorWithCode:code message:message];
    JMVoyageSDKEventItem *eventItem = [JMVoyageSDKEventItem event:JMVoyageSDKEventId_SDKError error:report];
    [[JMVoyageSDKEvent shared] uploadEvent:eventItem];
    return report;
}

+ (instancetype)voyage_common {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Common.Error"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Common message:msg];
}

+ (instancetype)voyage_global_uninitialized {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Global.Uninitialized"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Global_Uninitialized message:msg];
}

+ (instancetype)voyage_global_unsigned {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Global.Unsigned"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Global_Unsigned message:msg];
}

+ (instancetype)voyage_global_noguest {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Global.Noguest"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Bound_Failed message:msg];
}

+ (instancetype)voyage_global_authexpired {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Global.AuthExpired"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Global_AuthExpired message:msg];
}

+ (instancetype)voyage_global_authcanceled {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Global.AuthCanceled"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Global_AuthCanceled message:msg];
}

+ (instancetype)voyage_initialized_baseurl_failed {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Init.BaseURLFailed"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Common message:msg];
}

+ (instancetype)voyage_initialized_failed {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Init.Failed"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Initialized_Failed message:msg];
}

+ (instancetype)voyage_initializedThirdparty_failed {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"InitThirdparty.Failed"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_InitializedThirdparty_Failed message:msg];
}

+ (instancetype)voyage_recharge_repeated {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Recharge.Repeated"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Recharge_Repeated message:msg];
}

+ (instancetype)voyage_recharge_canceled {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Recharge.Canceled"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Recharge_Canceled message:msg];
}

+ (instancetype)voyage_recharge_incompleted {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Recharge.Incompleted"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Recharge_Incompleted message:msg];
}

+ (instancetype)voyage_recharge_noAppleProduct {
    NSString *msg = [JMVoyageSDKResource stringNamed:@"Recharge.NoAppleProduct"];
    return [self voyage_reportWithCode:JMVoyageSDKReportCode_Recharge_NoAppleProduct message:msg];
}

@end
