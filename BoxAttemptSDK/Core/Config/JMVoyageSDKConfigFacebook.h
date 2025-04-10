//
//  JMVoyageSDKConfigFacebook.h
//  JMVoyageSDKBase
//
//  Created by ZhengXianda on 1/9/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKConfigFacebook : NSObject

@property (nonatomic, strong) NSString *clientId;
@property (nonatomic, strong) NSString *clientToken;
@property (nonatomic, strong, nullable) NSString *displayName;
@property (nonatomic, strong, nullable) NSString *universalLink;

- (instancetype)initWithData:(NSDictionary *)data;
- (BOOL)isValid;

@end

NS_ASSUME_NONNULL_END
