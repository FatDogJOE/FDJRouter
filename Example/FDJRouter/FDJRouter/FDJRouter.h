//
//  FDJRouter.h
//  FDJRouter_Example
//
//  Created by mac on 2019/10/30.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDJRouterProtocol.h"
#import "FDJDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDJRouter : NSObject

@property (nonatomic, getter=currentVC) UIViewController * currentViewController;
@property (nonatomic, readonly) UITabBarController * tabBarController;

//Default is "router"
@property (nonatomic, strong) NSString * scheme;

+ (instancetype)instance;

- (void)registerPath:(NSString * _Nonnull)path forClass:(Class<FDJRouterProtocol>)pageClass;
- (void)registerDomain:(NSString * _Nonnull)domain;

- (void)setupRootPages:(NSArray<NSString *> * _Nullable)rootURLs;

- (void)openURL:(NSString * _Nonnull)url type:(OpenType)type params:(NSDictionary * _Nullable)params finishCallback:(FinishedCallback)finished;

@end

NS_ASSUME_NONNULL_END
