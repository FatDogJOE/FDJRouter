//
//  UIViewController+FDJNavigationCompletion.m
//  FDJRouter_Example
//
//  Created by mac on 2019/11/5.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import "UIViewController+FDJNavigationCompletion.h"
#import <objc/runtime.h>

@implementation UIViewController (FDJNavigationCompletion)

- (void)setFinished:(FinishedCallback)finished {
    objc_setAssociatedObject(self, "finishedCallback", finished, OBJC_ASSOCIATION_COPY);
}

- (void)setPageUrl:(NSString *)pageUrl {
    objc_setAssociatedObject(self, "pageUrl", pageUrl, OBJC_ASSOCIATION_COPY);
}

- (FinishedCallback)finished {
    return objc_getAssociatedObject(self, "finishedCallback");
}

- (NSString *)pageUrl {
    return objc_getAssociatedObject(self, "pageUrl");
}

@end
