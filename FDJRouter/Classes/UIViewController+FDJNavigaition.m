//
//  UIViewController+FDJNavigaition.m
//  FDJRouter_Example
//
//  Created by mac on 2019/11/1.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import "UIViewController+FDJNavigaition.h"

@implementation UIViewController (FDJNavigaition)

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
