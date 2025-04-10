//
//  JMVoyageSDKFlyer.m
//  JMVoyageSDK
//
//  Created by ZhengXianda on 12/1/22.
//

#import "JMVoyageSDKFlyer.h"

#import <JMUtils/JMUtils.h>
#import <JMFlyer/JMFlyer.h>

#import "JMVoyageSDKInfo.h"

static NSString *JMVoyageSDKFlyerEventId_Install = @"af_install";//用户打开游戏，初始化SDK的时候 {af_openid}
static NSString *JMVoyageSDKFlyerEventId_Login = @"af_login";//SDK登录成功 {af_openid}
static NSString *JMVoyageSDKFlyerEventId_Register = @"af_new_registration";//SDK完成注册 {af_openid}
static NSString *JMVoyageSDKFlyerEventId_Register_Completed = @"af_complete_registration";//生成游戏userid，并确认之前不存在服务器内，上报 {af_openid,af_userid}
static NSString *JMVoyageSDKFlyerEventId_CreateCharacter = @"af_create_charactar";//玩家创建一个新角色的时候上报 {af_openid}
static NSString *JMVoyageSDKFlyerEventId_Purchase = @"af_purchase";//用户每进行一次付费行为计为一次付费次数以及充值金额 {af_price,af_price_type,af_openid,af_goodsid,af_goodsnum}

static NSString *JMVoyageSDKFlyerEventParam_OpenId  = @"af_openid";//（用户openId）
static NSString *JMVoyageSDKFlyerEventParam_UserId = @"af_userid";//（游戏userId）
static NSString *JMVoyageSDKFlyerEventParam_Price  = @"af_revenue";//（金额）
static NSString *JMVoyageSDKFlyerEventParam_Currency  = @"af_currency";//（货币类型）
static NSString *JMVoyageSDKFlyerEventParam_GoodsId  = @"af_goodsid";//（BOOM商品id）
static NSString *JMVoyageSDKFlyerEventParam_GoodsCount  = @"af_goodsnum";//（商品数量）

@implementation JMVoyageSDKFlyer

#pragma mark - shared

+ (instancetype)shared {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)debug:(BOOL)isDebug {
    [JMFlyer debug:isDebug];
}

- (void)setCustomerUserID:(NSString *)customerUserID {
    [JMFlyer setCustomerUserID:customerUserID];
}
- (void)setAdditionalData:(NSDictionary *)additionalData {
    [JMFlyer setAdditionalData:additionalData];
}

- (void)uploadEvent:(NSString *)event withValues:(NSDictionary *)values {
    JMLog(@"FLY Event:%@, values:%@", event, values);
    [JMFlyer logEvent:event withValues:values];
}

- (void)uploadInstall {
    [self uploadEvent:JMVoyageSDKFlyerEventId_Install withValues:nil];
}

- (void)uploadLogin {
    [self uploadEvent:JMVoyageSDKFlyerEventId_Login withValues:@{
        JMVoyageSDKFlyerEventParam_OpenId: JMVoyageSDKInfo.shared.openId
    }];
}

- (void)uploadRegister {
    [self uploadEvent:JMVoyageSDKFlyerEventId_Register withValues:@{
        JMVoyageSDKFlyerEventParam_OpenId: JMVoyageSDKInfo.shared.openId
    }];
}

- (void)uploadRegisterCompletedWithUserId:(NSString *)userId {
    [self uploadEvent:JMVoyageSDKFlyerEventId_Register_Completed withValues:@{
        JMVoyageSDKFlyerEventParam_OpenId: JMVoyageSDKInfo.shared.openId,
        JMVoyageSDKFlyerEventParam_UserId: userId,
    }];
}

- (void)uploadCreateCharacter {
    [self uploadEvent:JMVoyageSDKFlyerEventId_CreateCharacter withValues:@{
        JMVoyageSDKFlyerEventParam_OpenId: JMVoyageSDKInfo.shared.openId
    }];
}

- (void)uploadPurchaseWithGoodsId:(NSString *)goodsId
                       goodsCount:(NSString *)goodsCount
                            price:(NSString *)price
                         currency:(NSString *)currency {
    [self uploadEvent:JMVoyageSDKFlyerEventId_Purchase withValues:@{
        JMVoyageSDKFlyerEventParam_OpenId: JMVoyageSDKInfo.shared.openId,
        JMVoyageSDKFlyerEventParam_GoodsId: goodsId,
        JMVoyageSDKFlyerEventParam_GoodsCount: goodsCount,
        JMVoyageSDKFlyerEventParam_Price: price,
        JMVoyageSDKFlyerEventParam_Currency: currency,
    }];
}

@end
