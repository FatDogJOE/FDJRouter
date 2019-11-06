//
//  VC3Controller.m
//  FDJRouter_Example
//
//  Created by mac on 2019/11/6.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import "VC3Controller.h"

@interface VC3Controller ()

@end

@implementation VC3Controller

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)configNavigationBar {
    self.navigationItem.title = @"VC3";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(leftClicked)];
}

- (void)rightClicked {
    [[FDJRouter instance] openURL:@"router://domain1/path1/path2" type:OpenTypeAuto params:nil finishCallback:^(NSDictionary * _Nullable info) {
        
    }];
}

- (void)leftClicked {
    [self.fdj_navigation backToURL:@"router://domain1/path1"];
//    [self.fdj_navigation backWithInfo:@{@"success":@YES}];
//    [self.fdj_navigation closeWithInfo:@{@"success":@YES}];
    
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
