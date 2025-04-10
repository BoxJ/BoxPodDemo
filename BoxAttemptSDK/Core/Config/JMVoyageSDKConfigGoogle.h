//
//  JMVoyageSDKConfigGoogle.h
//  JMVoyageSDKBase
//
//  Created by ZhengXianda on 1/9/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKConfigGoogle : NSObject

@property (nonatomic, strong) NSString *clientId;

- (instancetype)initWithData:(NSDictionary *)data;

- (BOOL)isValid;

@end

NS_ASSUME_NONNULL_END
