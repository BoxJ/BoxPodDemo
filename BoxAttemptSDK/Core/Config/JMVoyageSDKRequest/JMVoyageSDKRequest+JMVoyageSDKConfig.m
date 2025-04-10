//
//  JMVoyageSDKRequest+JMVoyageSDKConfig.m
//  JMVoyageSDK
//
//  Created by Thief Toki on 2021/1/20.
//

#import "JMVoyageSDKRequest+JMVoyageSDKConfig.h"

@implementation JMVoyageSDKRequest (JMVoyageSDKConfig)

- (void)fetchBaseURLWithCallback:(JMRequestCallback)callback {
    NSString *path = @"/open/baseUrl";
    NSDictionary *parameters = @{
    
    };
    
    [self requestDataWithMethod:JMRequestMethodType_GET
                           path:path
                     parameters:parameters
                       callback:callback];
}

- (void)fetchConfigWithCallback:(JMRequestCallback)callback {
    NSString *path = @"/client/init/config";
    NSDictionary *parameters = @{
    
    };
    
    [self requestDataWithMethod:JMRequestMethodType_GET
                           path:path
                     parameters:parameters
                       callback:callback];
}

@end
