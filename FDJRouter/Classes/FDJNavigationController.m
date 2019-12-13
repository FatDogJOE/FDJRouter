//
//  FDJNavigationController.m
//  FDJRouter_Example
//
//  Created by mac on 2019/11/1.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import "FDJNavigationController.h"
#import "FDJRouterProtocol.h"

@interface FDJNavigationController ()

@end

@implementation FDJNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Public Methods

- (void)closeWithInfo:(NSDictionary *)info {
    if (self.closeCallback) {
        [self dismissViewControllerAnimated:YES completion:^{
            self.closeCallback(info);
        }];
    }
}

- (void)backWithInfo:(NSDictionary *)info {
    UIViewController * vc = self.topViewController;
    
    if (vc.finished) {
        vc.finished(info);
    }
    
    [self popViewControllerAnimated:YES];
}

- (void)backToURL:(NSString *)url {
    
    [self.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj conformsToProtocol:@protocol(FDJRouterProtocol)]) {
            UIViewController * vc = (UIViewController<FDJRouterProtocol> *)obj;
            if ([vc.pageUrl isEqualToString:url]) {
                [self popToViewController:vc animated:YES];
                *stop = YES;
            }
        }
    }];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
