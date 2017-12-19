//
//  HomeThreeViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/18.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "HomeThreeViewController.h"

@interface HomeThreeViewController ()

@end

@implementation HomeThreeViewController

- (void)leftItemAction {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backView.backgroundColor = [UIColor grayColor];
    self.rootViewNavgationBar.title = @"HOME_THREE";
    
    self.rootViewNavgationBar.leftItem = [[XYYBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"button_back"] target:self action:@selector(leftItemAction)];
    
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
