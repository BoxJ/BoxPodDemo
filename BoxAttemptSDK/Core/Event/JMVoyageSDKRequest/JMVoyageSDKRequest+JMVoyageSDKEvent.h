//
//  JMVoyageSDKRequest+JMVoyageSDKEvent.h
//  JMVoyageSDK
//
//  Created by Thief Toki on 2021/1/20.
//

#import <JMVoyageSDKBase/JMVoyageSDKRequest.h>

NS_ASSUME_NONNULL_BEGIN

@class JMVoyageSDKEventItem;
@interface JMVoyageSDKRequest (JMVoyageSDKEvent)

- (void)uploadEvents:(NSArray <JMVoyageSDKEventItem *>*)events
            callback:(JMRequestCallback)callback;

@end

NS_ASSUME_NONNULL_END
