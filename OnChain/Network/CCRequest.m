//
//  CCRequest.m
//  OnChain
//
//  Created by Zeus.Zhang on 2018/1/31.
//  Copyright © 2018年 Zeus. All rights reserved.
//

#import "CCRequest.h"
#import <AFNetworkReachabilityManager.h>
#import "Api.h"

@implementation CCRequest {
    AFHTTPSessionManager *manager;
}

static CCRequest *shareInstance = nil;
static NSInteger networkStatus = -1;
+ (CCRequest *)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[CCRequest alloc] init];
    });
    return shareInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (shareInstance == nil) {
        shareInstance = [super allocWithZone:zone];
    }
    return shareInstance;
}

- (id)copyWithZone:(NSZone *)zone {
    return shareInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        manager = [[AFHTTPSessionManager manager] init];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        manager.requestSerializer.timeoutInterval = 15;
    }
    return self;
}

+ (void)checkNetworkLinkStatus {
    AFNetworkReachabilityManager *reachability = [AFNetworkReachabilityManager sharedManager];
    [reachability setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        networkStatus = status;
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                
                break;
            case  AFNetworkReachabilityStatusNotReachable:
                
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                
                break;
            default:
                break;
        }
    }];
    [reachability startMonitoring];
}

+ (NSInteger)theNetworkStatus {
    return networkStatus;
}

- (void)requestWithURLString:(NSString *)urlString MethodType:(MethodType)methodType Params:(id)params Success:(CCSuccess)success Failure:(CCFailure)failure {
    NSString *requestUrl;
    NSMutableDictionary *params_dict = [[NSMutableDictionary alloc] init];
    if ([urlString hasPrefix:@"http"]) {
        requestUrl = urlString;
    } else {
        requestUrl = [BaseURL stringByAppendingString:urlString];
    }
    switch (methodType) {
        case MethodTypePOST:
        {
            [manager POST:requestUrl parameters:params_dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponse:responseObject Success:success Failure:failure];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self showError:error DataTask:task Failure:failure];
            }];
        }
            break;
        case MethodTypeGET:
        {
            [manager GET:requestUrl parameters:params_dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self handleResponse:responseObject Success:success Failure:failure];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self showError:error DataTask:task Failure:failure];
            }];
        }
            break;
        default:
            break;
    }
}

- (void)handleResponse:(id)responseObject
               Success:(CCSuccess)success
               Failure:(CCFailure)failure
{
    
}

- (id)showError:(NSError *)error
       DataTask:(NSURLSessionDataTask *)task
        Failure:(CCFailure)failure
{
    NSLog(@"userInfo:%@",error.userInfo);
//    NSDictionary *responseDic = nil;
//    @try {
//        if ([error.userInfo objectForKey:@"com.alamofire.serialization.response.error.data"]) {
//            responseDic = [NSJSONSerialization JSONObjectWithData:[error.userInfo valueForKey:@"com.alamofire.serialization.response.error.data"] options:kNilOptions error:nil];
//            NSLog(@"%@",responseDic);
//        } else {
//            failure(nil,error.userInfo[NSLocalizedDescriptionKey],nil);
//            return nil;
//        }
//    } @catch (NSException *exception) {
//
//        failure(nil,NETWORK_NOTKNOW,nil);
//        return nil;
//    }
//    if ([responseDic valueForKey:ResponseMsg]) {
//        failure(error,[responseDic valueForKey:ResponseMsg],task);
//        return [[NSMutableDictionary alloc] init];
//    } else {
//
//        failure(nil,NETWORK_NOTKNOW,nil);
        return nil;
//    }
}



@end
