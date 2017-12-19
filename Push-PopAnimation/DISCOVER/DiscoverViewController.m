//
//  DiscoverViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/18.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DisTwoViewController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)rightItemAction {
    DisTwoViewController *vc = [[DisTwoViewController alloc] init];
    vc.title = @"SCROLLVIEW";
    [self.ctrl.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backView.backgroundColor = [UIColor redColor];
    
    self.rootViewNavgationBar.rightItem = [[XYYBarButtonItem alloc] initWithTitle:@"PUSH" target:self action:@selector(rightItemAction)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
