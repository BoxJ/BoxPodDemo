//
//  JMVoyageSDKApplication.m
//  JMAppleAuth
//
//  Created by ZhengXianda on 1/9/23.
//

#import "JMVoyageSDKApplication.h"

@implementation JMVoyageSDKApplication

#pragma mark - shared

+ (JMVoyageSDKApplication *)shared {
    static JMVoyageSDKApplication *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)registerApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary  *)launchOptions {
    self.launchApplication = application;
    self.launchOptions = launchOptions;
}

@end
