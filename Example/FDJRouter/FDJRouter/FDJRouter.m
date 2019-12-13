//
//  FDJRouter.m
//  FDJRouter_Example
//
//  Created by mac on 2019/10/30.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import "FDJRouter.h"
#import "FDJNavigationController.h"

@interface FDJRouter()<UINavigationControllerDelegate, UITabBarControllerDelegate>

@property (nonatomic, strong) NSMutableDictionary * controllers;
@property (nonatomic, strong) NSMutableDictionary * domains;

@end

@implementation FDJRouter

+ (instancetype)instance {
    static FDJRouter * router;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[self alloc] init];
    });
    return router;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _controllers = [NSMutableDictionary dictionary];
        _domains = [NSMutableDictionary dictionary];
        
        _tabBarController = [[UITabBarController alloc] init];
        _tabBarController.delegate = self;
        
        _scheme = @"router";
    }
    return self;
}

#pragma mark - Public Methodsgit

- (void)registerPath:(NSString * _Nonnull)path forClass:(Class<FDJRouterProtocol>)pageClass {
    _controllers[path] = pageClass;
}

- (void)registerDomain:(NSString * _Nonnull)domain {
    _domains[domain] = domain;
}

- (void)setupRootPages:(NSArray<NSString *> * _Nullable)rootURLs {
    
    NSMutableArray * rootControllers = [NSMutableArray array];
    
    [rootURLs enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSURL * url = [NSURL URLWithString:obj];
        NSString * domain = self.domains[url.host];
        
        UIViewController<FDJRouterProtocol> * vc = [self viewControllerWithPath:url.path params:nil];
        
        if (vc && domain) {
            FDJNavigationController * navVC = [[FDJNavigationController alloc] initWithRootViewController:vc];
            vc.pageUrl = obj;
            navVC.delegate = self;
            navVC.domain = domain;
            
            if ([vc respondsToSelector:@selector(configTabbar)]) {
                [vc configTabbar];
            }
            
            [rootControllers addObject:navVC];
        }
    }];
    
    self.tabBarController.viewControllers = rootControllers;
    
}

- (void)openURL:(NSString * _Nonnull)url type:(OpenType)type params:(NSDictionary * _Nullable)params finishCallback:(FinishedCallback)finished {
    
    if (type == OpenTypePush) {
        [self pushUrl:url params:params finishCallback:finished];
    }else if (type == OpenTypePresent) {
        [self presentUrl:url params:params finishCallback:finished];
    }else {
        NSURL * URL = [NSURL URLWithString:url];

        if ([URL.host isEqualToString:[self currentNav].domain] && ([URL.path containsString:[self currentURL].path] || [URL.path isEqualToString:[self currentURL].path])) {
            [self pushUrl:url params:params finishCallback:finished];
        }else {
            [self presentUrl:url params:params finishCallback:finished];
        }
    }
    
}

#pragma mark - Private Methods

- (void)pushUrl:(NSString * _Nonnull)url params:(NSDictionary * _Nullable)params finishCallback:(FinishedCallback)finished {
    
    NSURL * URL = [NSURL URLWithString:url];
    
    FDJNavigationController * nav = [self currentNav];
    
    if ([URL.host isEqualToString:nav.domain]) {
        UIViewController<FDJRouterProtocol> * vc = [self viewControllerWithPath:URL.path params:params];
        vc.hidesBottomBarWhenPushed = YES;
        vc.finished = finished;
        vc.pageUrl = url;
        vc.openType = OpenTypePush;
        [nav pushViewController:vc animated:YES];
    }
    
}

- (void)presentUrl:(NSString * _Nonnull)url params:(NSDictionary * _Nullable)params finishCallback:(FinishedCallback)finished {
    
    NSURL * URL = [NSURL URLWithString:url];
    
    NSString * domain = self.domains[URL.host];
    
    UIViewController<FDJRouterProtocol> * vc = [self viewControllerWithPath:URL.path params:params];
    
    if (domain && vc) {
        FDJNavigationController * navVC = [[FDJNavigationController alloc] initWithRootViewController:vc];
        
        UIModalPresentationStyle style;
        
        if (@available(iOS 13, *)) {
            style = UIModalPresentationAutomatic;
        }else {
            style = UIModalPresentationFullScreen;
        }
        
        if ([vc respondsToSelector:@selector(preferrdPresentationStlye)]) {
            style = [vc preferrdPresentationStlye];
        }
        
        navVC.modalPresentationStyle = style;
        
        vc.pageUrl = url;
        vc.openType = OpenTypePresent;
        navVC.closeCallback = ^(NSDictionary * _Nullable info) {
            if (finished) {
                finished(info);
            }
        };
        navVC.delegate = self;
        navVC.domain = domain;
        
        [self.currentVC presentViewController:navVC animated:YES completion:nil];
    }
    
}

- (UIViewController<FDJRouterProtocol> *)viewControllerWithPath:(NSString *)path params:(NSDictionary *)params {
    
    Class<FDJRouterProtocol> pageClass = self.controllers[path];
    
    UIViewController<FDJRouterProtocol> *vc = [[pageClass alloc] initWithParams:params];
    
    return vc;
}

- (UIViewController *)currentVC {
    
    FDJNavigationController * nav = self.tabBarController.selectedViewController;
    
    UIViewController * vc = nav.presentedViewController;
    
    if (vc == nil) {
        return nav;
    }else {
        while (vc.presentedViewController != nil) {
            vc = vc.presentedViewController;
        }
        return vc;
    }
    
}

- (FDJNavigationController *)currentNav {
    
    FDJNavigationController * nav = self.tabBarController.selectedViewController;
    
    UIViewController * vc = nav;
    
    if (vc.presentedViewController == nil) {
        return (FDJNavigationController *)vc;
    }else {
        
        while (vc.presentedViewController != nil) {
            vc = nav.presentedViewController;
            
            if ([vc isKindOfClass:FDJNavigationController.class]) {
                nav = (FDJNavigationController *)vc;
            }
        }
        return nav;
    }
}

- (NSURL *)currentURL {
    FDJNavigationController * nav = [self currentNav];
    UIViewController<FDJRouterProtocol> * currentVC = (UIViewController<FDJRouterProtocol> *)[nav topViewController];
    return [NSURL URLWithString:currentVC.pageUrl];
}

#pragma mark - UITabbarControllerDelegate

- (UIInterfaceOrientationMask)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController {
    return tabBarController.selectedViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)tabBarControllerPreferredInterfaceOrientationForPresentation:(UITabBarController *)tabBarController {
    return tabBarController.selectedViewController.preferredInterfaceOrientationForPresentation;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController conformsToProtocol:@protocol(FDJRouterProtocol)]) {
        UIViewController<FDJRouterProtocol> * routerVC = (UIViewController<FDJRouterProtocol> *)viewController;
        [routerVC configNavigationBar];
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController
{
    return navigationController.topViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController
{
    return navigationController.topViewController.preferredInterfaceOrientationForPresentation;
}


@end
