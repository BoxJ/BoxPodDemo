//
//  JMVoyageSDKRisk.m
//  JMVoyageSDK
//
//  Created by ZhengXianda on 12/1/22.
//

#import "JMVoyageSDKRisk.h"

#import <JMRisk/JMRisk.h>

@implementation JMVoyageSDKRisk

#pragma mark - shared

+ (instancetype)shared {
    static JMVoyageSDKRisk *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [JMRisk setServerType:3];
    }
    return self;
}

- (void)initWithCallback:(JMBusinessCallback)callback {
    [[JMRisk shared] init:@"YD00950703452569" callback:callback];
}

- (void)getToken:(NSString *)businessId completeHandler:(JMBusinessCallback)callback {
    [[JMRisk shared] getToken:businessId completeHandler:callback];
}

- (void)roleLogin:(NSString *)businessId 
           roleId:(NSString *)roleId
         roleName:(NSString *)roleName
      roleAccount:(NSString *)roleAccount
       roleServer:(NSString *)roleServer
         serverId:(int)serverId
         gameJson:(NSString *)gameJson
         callback:(JMBusinessCallback)callback{
    [[JMRisk shared] roleLogin:businessId
                        roleId:roleId
                      roleName:roleName
                   roleAccount:roleAccount
                    roleServer:roleServer
                      serverId:serverId
                      gameJson:gameJson
                      callback:callback];
}

- (void)roleLogout {
    [[JMRisk shared] roleLogout];
}

@end
