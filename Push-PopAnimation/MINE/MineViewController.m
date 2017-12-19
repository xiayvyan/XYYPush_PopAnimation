//
//  MineViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/15.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "MineViewController.h"
#import "SecondViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    self.backView.backgroundColor = [UIColor orangeColor];
    
    XYYBarButtonItem *leftItem = [[XYYBarButtonItem alloc] initWithTitle:@"变色" target:self action:@selector(leftItemAction)];
    self.rootViewNavgationBar.leftItem = leftItem;
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn0.frame = CGRectMake(10, 0, 40, 44);
    [btn0 setTitle:@"Push" forState:UIControlStateNormal];
    btn0.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [btn0 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn0 addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:btn0];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(55, 0, 50, 44);
    [btn1 setTitle:@"点击" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [btn1 setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:btn1];
    
    XYYBarButtonItem *rightItem = [[XYYBarButtonItem alloc] initWithCustomView:rightView];
    self.rootViewNavgationBar.rightItem = rightItem;
}

- (void)leftItemAction {
    if ([self.backView.backgroundColor isEqual:[UIColor redColor]]) {
        self.backView.backgroundColor = [UIColor orangeColor];
    }else{
        self.backView.backgroundColor = [UIColor redColor];
    }
}

- (void)push {
    SecondViewController *vc = [[SecondViewController alloc] init];
    vc.title = @"Second";
    [self.ctrl.navigationController pushViewController:vc animated:YES];
}

- (void)btn1Click {
    NSLog(@"--------点击--------");
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
