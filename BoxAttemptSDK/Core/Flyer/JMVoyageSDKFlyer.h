//
//  JMVoyageSDKFlyer.h
//  JMVoyageSDK
//
//  Created by ZhengXianda on 12/1/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JMVoyageSDKFlyer: NSObject

#pragma mark - shared

+ (instancetype)shared;

- (void)debug:(BOOL)isDebug;

- (void)setCustomerUserID:(NSString *)customerUserID;
- (void)setAdditionalData:(NSDictionary *)additionalData;

- (void)uploadEvent:(NSString *)event withValues:(NSDictionary * _Nullable)values;
- (void)uploadInstall;
- (void)uploadLogin;
- (void)uploadRegister;
- (void)uploadRegisterCompletedWithUserId:(NSString *)userId;
- (void)uploadCreateCharacter;
- (void)uploadPurchaseWithGoodsId:(NSString *)goodsId
                       goodsCount:(NSString *)goodsCount
                            price:(NSString *)price
                         currency:(NSString *)currency;

@end

NS_ASSUME_NONNULL_END
