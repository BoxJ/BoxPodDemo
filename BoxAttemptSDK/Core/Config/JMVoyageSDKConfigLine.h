//
//  JMVoyageSDKConfigLine.h
//  JMVoyageSDKBase
//
//  Created by ZhengXianda on 1/9/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKConfigLine : NSObject

@property (nonatomic, strong) NSString *channelId;
@property (nonatomic, strong, nullable) NSString *universalLink;

- (instancetype)initWithData:(NSDictionary *)data;

- (BOOL)isValid;

@end

NS_ASSUME_NONNULL_END
