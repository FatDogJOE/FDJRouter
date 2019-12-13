//
//  UIViewController+FDJNavigaition.m
//  FDJRouter_Example
//
//  Created by mac on 2019/11/1.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import "UIViewController+FDJNavigaition.h"
#import <objc/runtime.h>

@implementation UIViewController (FDJNavigaition)

- (void)setOpenType:(OpenType)openType {
    objc_setAssociatedObject(self, "openType", @(openType), OBJC_ASSOCIATION_ASSIGN);
}

- (OpenType)openType {
    NSNumber * openType = objc_getAssociatedObject(self, "openType");
    return openType.integerValue;
}

- (FDJNavigationController *)fdj_navigation {
    if ([self.navigationController isKindOfClass:[FDJNavigationController class]]) {
        return (FDJNavigationController *)self.navigationController;
    }else {
        return nil;
    }
}

- (void)configNavigationBar {
    NSLog(@"Placeholder methods");
}

@end
