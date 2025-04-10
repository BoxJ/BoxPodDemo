//
//  JMVoyageSDKRisk.h
//  JMVoyageSDK
//
//  Created by ZhengXianda on 12/1/22.
//

#import <Foundation/Foundation.h>

#import <JMBusiness/JMBusiness.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKRisk: NSObject

#pragma mark - shared

+ (instancetype)shared;

- (void)initWithCallback:(JMBusinessCallback)callback;

- (void)getToken:(NSString *)businessId completeHandler:(JMBusinessCallback)callback;

- (void)roleLogin:(NSString *)businessId
           roleId:(NSString *)roleId
         roleName:(NSString *)roleName
      roleAccount:(NSString *)roleAccount
       roleServer:(NSString *)roleServer
         serverId:(int)serverId
         gameJson:(NSString *)gameJson
         callback:(JMBusinessCallback)callback;

- (void)roleLogout;

@end

NS_ASSUME_NONNULL_END
