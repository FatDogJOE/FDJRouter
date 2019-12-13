//
//  FDJRouterProtocol.h
//  FDJRouter_Example
//
//  Created by mac on 2019/10/30.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDJNavigationController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FDJRouterNavigation

@optional

@property (nonatomic, assign) OpenType openType;

- (FDJNavigationController *)fdj_navigation;
- (void)configNavigationBar;

@end

@protocol FDJRouterProtocol <FDJRouterNavigation>

@required

+ (instancetype)alloc;
- (instancetype)initWithParams:(NSDictionary * _Nullable)params;
- (UIModalPresentationStyle)preferrdPresentationStlye;

@optional

- (void)configTabbar;

@end



NS_ASSUME_NONNULL_END
