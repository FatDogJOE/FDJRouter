//
//  UIViewController+FDJNavigaition.h
//  FDJRouter_Example
//
//  Created by mac on 2019/11/1.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FDJRouterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FDJNavigaition)<FDJRouterNavigation>

- (FDJNavigationController *)fdj_navigation;

@end

NS_ASSUME_NONNULL_END
