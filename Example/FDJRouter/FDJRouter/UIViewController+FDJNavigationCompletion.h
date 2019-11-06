//
//  UIViewController+FDJNavigationCompletion.h
//  FDJRouter_Example
//
//  Created by mac on 2019/11/5.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "FDJDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FDJNavigationCompletion)

@property (nonatomic, copy) NSString * pageUrl;
@property (nonatomic, copy) FinishedCallback finished;

@end

NS_ASSUME_NONNULL_END
