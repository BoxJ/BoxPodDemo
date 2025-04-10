//
//  JMVoyageSDKResource.m
//  JMVoyageSDK
//
//  Created by ZhengXianda on 11/08/2022.
//  Copyright (c) 2022 ZhengXianda. All rights reserved.
//

#import "JMVoyageSDKResource.h"

#import <JMTheme/JMTheme.h>
#import <JMUIKit/JMUIKit.h>

// JiaMian Berserkly Resource Nail
NSString *JMBRNCorner = @"JMResourceFloatName:JMBRNCorner";

@interface JMVoyageSDKResource ()

@property (nonatomic, assign) JMVoyageSDKResourceStyle style;

@end

@implementation JMVoyageSDKResource

- (NSString *)name {
    return @"JMVoyageSDKBase";
}

- (void)registerResourceStyle:(JMVoyageSDKResourceStyle)style {
    self.style = style;
    switch (style) {
        case JMVoyageSDKResourceStyle_DEFAULT : {
            [self registerResourceMap:@{ 

            }];
        }
            break;
    }
}

- (void)registerResourceMap:(NSDictionary<NSString *,NSString *> *)resourceMap {
    [super registerResourceMap:resourceMap];

    //JMThemeRegistT UIKit
    //JMThemeRegistT(JMTipsModalView,
    //               cancelButtonTitleColor: [[JMVoyageSDKResource shared] resourceWithName:<#JMBRN#>]);
    //JMThemeRegistT(JMToastLoadingView,
    //               loadingAnimationImages: (^NSDictionary *(){
    //    NSMutableArray *animationImages = [NSMutableArray array];
    //    for (NSInteger i=0; i<=<#count#>; i++) {
    //        NSString *name = [NSString stringWithFormat:@"<#image_format#>", i];
    //        [animationImages addObject:[JMVoyageSDKResource imageNamed:name]];
    //    }
    //    return [animationImages copy];
    //}()),
    //               loadingAnimationDuration: @(<#duration#>));
    //JMThemeRegistT(JMToastSuccessView,
    //               successImage: [JMVoyageSDKResource imageNamed:@"<#image_name#>"]);
    //JMThemeRegistT(JMModalTopView,
    //               logoImage: [JMVoyageSDKResource imageNamed:@"<#image_name#>"],
    //               backButtonImage: [JMVoyageSDKResource imageNamed:@"<#image_name#>"],
    //               closeButtonImage: [JMVoyageSDKResource imageNamed:@"<#image_name#>"]);
    //JMThemeRegistT(JMModalView, 
    //               corner: [[JMVoyageSDKResource shared] resourceWithName:<#JMBRN#>]);
    //JMThemeRegistT(JMCommonButton,
    //               corner: [[JMVoyageSDKResource shared] resourceWithName:<#JMBRN#>],
    //               backgroundColor: [[JMVoyageSDKResource shared] resourceWithName:<#JMBRN#>],
    //               titleFont: [[JMVoyageSDKResource shared] resourceWithName:<#JMBRN#>],
    //               titleColor: [[JMVoyageSDKResource shared] resourceWithName:<#JMBRN#>]);
    //JMThemeRegistT(JMCompositeTitleView,
    //               titleFont: [[JMVoyageSDKResource shared] resourceWithName:<#JMBRN#>]);
    //JMThemeRegistT(JMInputView,
    //               corner: [[JMVoyageSDKResource shared] resourceWithName:<#JMBRN#>]);
    //JMThemeRegistT(JMWebTitleView,
    //               backButtonImage: [JMVoyageSDKResource imageNamed:@"<#image_name#>"]);
}

- (id)resourceWithName:(NSString *)name {
    if (!self.registered) {
        [self registerResourceStyle:self.style];
    }
    return [super resourceWithName:name];
}

- (id)resourceValueWithName:(NSString *)name {
    if (!self.registered) {
        [self registerResourceStyle:self.style];
    }
    return [super resourceValueWithName:name];
}

@end
