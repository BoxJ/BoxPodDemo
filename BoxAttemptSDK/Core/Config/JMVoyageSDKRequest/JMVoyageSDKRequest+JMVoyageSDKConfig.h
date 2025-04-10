//
//  JMVoyageSDKRequest+JMVoyageSDKConfig.h
//  JMVoyageSDK
//
//  Created by Thief Toki on 2021/1/20.
//

#import <JMVoyageSDKBase/JMVoyageSDKRequest.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKRequest (JMVoyageSDKConfig)

- (void)fetchBaseURLWithCallback:(JMRequestCallback)callback;
- (void)fetchConfigWithCallback:(JMRequestCallback)callback;

@end

NS_ASSUME_NONNULL_END
