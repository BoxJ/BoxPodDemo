//
//  JMVoyageSDKResource.h
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import <JMResource/JMResource.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JMVoyageSDKResourceStyle) {
    JMVoyageSDKResourceStyle_DEFAULT = 0,
};

//通用
UIKIT_EXTERN NSString *JMBRNCorner;

@interface JMVoyageSDKResource : JMResource

- (void)registerResourceStyle:(JMVoyageSDKResourceStyle)style;

- (id)resourceWithName:(NSString *)name;
- (id)resourceValueWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
