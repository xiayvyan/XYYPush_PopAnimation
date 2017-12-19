//
//  ThirdViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/15.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)change:(UISegmentedControl *)segment {
    if (segment.selectedSegmentIndex) {
        self.backView.backgroundColor = [UIColor greenColor];
    }else{
        self.backView.backgroundColor = [UIColor redColor];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backView.backgroundColor = [UIColor redColor];
    
    NSArray *array=@[@"第一",@"第二"];
    UISegmentedControl *segmentControl=[[UISegmentedControl alloc]initWithItems:array];
    segmentControl.frame=CGRectMake(0, 0, 100, 30);
    segmentControl.selectedSegmentIndex=0;
    segmentControl.tintColor = [UIColor blackColor];
    [segmentControl addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    self.rootViewNavgationBar.titleView = segmentControl;
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
