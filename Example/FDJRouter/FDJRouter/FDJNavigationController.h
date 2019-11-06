//
//  FDJNavigationController.h
//  FDJRouter_Example
//
//  Created by mac on 2019/11/1.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+FDJNavigationCompletion.h"
#import "FDJDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface FDJNavigationController : UINavigationController

@property (nonatomic, strong) NSString * domain;
@property (nonatomic, copy) FinishedCallback closeCallback;

- (void)closeWithInfo:(NSDictionary *)info;
- (void)backWithInfo:(NSDictionary *)info;
- (void)backToURL:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
