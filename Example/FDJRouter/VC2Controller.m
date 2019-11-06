//
//  VC2Controller.m
//  FDJRouter_Example
//
//  Created by mac on 2019/11/6.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import "VC2Controller.h"

@interface VC2Controller ()

@end

@implementation VC2Controller

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
    self.navigationItem.title = @"VC2";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Open" style:UIBarButtonItemStylePlain target:self action:@selector(rightClicked)];
}

- (void)rightClicked {
    
    [[FDJRouter instance] openURL:@"router://domain1/path1/path2/path3" type:OpenTypeAuto params:nil finishCallback:^(NSDictionary * _Nullable info) {
        //[self.fdj_navigation closeWithInfo:@{@"vc2Success":@YES}];
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
