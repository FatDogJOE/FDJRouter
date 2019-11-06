//
//  VC7Controller.m
//  FDJRouter_Example
//
//  Created by mac on 2019/11/6.
//  Copyright © 2019 likethephoenix@163.com. All rights reserved.
//

#import "VC7Controller.h"

@interface VC7Controller ()

@end

@implementation VC7Controller

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

- (void)setupTabbar {
    
}

- (void)configNavigationBar {
    self.navigationItem.title = @"VC7";
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
