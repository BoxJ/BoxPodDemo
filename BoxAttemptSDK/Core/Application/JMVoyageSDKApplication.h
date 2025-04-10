//
//  JMVoyageSDKApplication.h
//  JMAppleAuth
//
//  Created by ZhengXianda on 1/9/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKApplication : NSObject

#pragma mark - shared

+ (JMVoyageSDKApplication *)shared;

@property (nonatomic, strong) UIApplication *launchApplication;
@property (nonatomic, strong) NSDictionary *launchOptions;

- (void)registerApplication:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary  *)launchOptions;

@end

NS_ASSUME_NONNULL_END
