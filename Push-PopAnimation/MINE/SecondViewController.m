//
//  SecondViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@", NSStringFromClass([self.navigationController.delegate class]));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backView.backgroundColor = [UIColor blueColor];

    XYYBarButtonItem *rightItem = [[XYYBarButtonItem alloc] initWithTitle:@"Third" target:self action:@selector(rightItemAction)];
    self.rootViewNavgationBar.rightItem = rightItem;
}

- (void)rightItemAction {
    ThirdViewController *vc = [[ThirdViewController alloc] init];
    vc.title = @"Third";
    [self.navigationController pushViewController:vc animated:YES];
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
