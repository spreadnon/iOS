//
//  NetTools.m
//  kunfan
//
//  Created by 坤凡 on 2017/3/1.
//  Copyright © 2017年 坤凡. All rights reserved.
//

#import "NetTools.h"
#import "Util.h"
//#import "HBConfig.h"
@implementation NetTools

    
- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.requestSerializer.timeoutInterval = 20;
    [self.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    self.responseSerializer.acceptableContentTypes=[self.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [self.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Accept-Encoding"];
    
    [self.requestSerializer setValue:[Util userAgent] forHTTPHeaderField:@"User-Agent"];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    self.securityPolicy.allowInvalidCertificates = YES;
    
    // 第三方授权登陆后无法获取第三方平台的用户信息，请示失败导致
    self.securityPolicy.validatesDomainName = NO;
    
    return self;
}
    
+ (NetTools *)sharedManager {
    static dispatch_once_t pred;
    static NetTools *_sharedManager = nil;
    
    if (kDebugMode) {
        NSString *url = [[NSUserDefaults standardUserDefaults] stringForKey:kForServerUse_URL];
        if (!url || url.length == 0){
            url = kBaseURL;
        }
        dispatch_once(&pred, ^{ _sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:url]]; });
        return _sharedManager;
    } else {
        dispatch_once(&pred, ^{ _sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseURL]]; });
        return _sharedManager;
    }
    
}
    
    
    // load from cache when network is not available.
- (AFHTTPRequestOperation *)HTTPCacheRequestOperationWithHTTPMethod:(NSString *)method
                                                          URLString:(NSString *)URLString
                                                         parameters:(id)parameters
                                                            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                                            failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure {
    NSError *serializationError = nil;
    NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:URLString relativeToURL:self.baseURL] absoluteString] parameters:parameters error:&serializationError];
    if (serializationError) {
        if (failure) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgnu"
            dispatch_async(self.completionQueue ?: dispatch_get_main_queue(), ^{
                failure(nil, serializationError);
            });
#pragma clang diagnostic pop
        }
        
        return nil;
    }
    
    // 未联网时不更改缓存策略，因为联网监测有问题，不准确
    //    if (!self.reachabilityManager.isReachable) {
    //        request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    //    }
    
    AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:success failure:failure];
    return operation;
}

    
@end
