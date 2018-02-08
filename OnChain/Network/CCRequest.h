//
//  CCRequest.h
//  OnChain
//
//  Created by Zeus.Zhang on 2018/1/31.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Api.h"
#import <AFNetworking.h>

typedef NS_ENUM(NSUInteger, MethodType) {
    MethodTypePOST,
    MethodTypeGET,
};

typedef void(^CCSuccess)(id responseObject,id responseOriginal);
typedef void(^CCFailure)(NSError *error,NSString *errorDesc,id responseOriginal);
typedef void(^CCProgress)(NSProgress *progress);

@interface CCRequest : NSObject

+ (CCRequest *)shareInstance;

+ (void)checkNetworkLinkStatus;

+ (NSInteger)theNetworkStatus;

- (void)requestWithURLString:(NSString *)urlString
                  MethodType:(MethodType)methodType
                      Params:(id)params
                     Success:(CCSuccess)success
                     Failure:(CCFailure)failure;

@end
