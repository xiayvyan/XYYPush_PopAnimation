//
//  DisTwoViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/18.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "DisTwoViewController.h"
#import "XYYScrollView.h"

@interface DisTwoViewController ()

@property (nonatomic, strong) XYYScrollView *scrollView;

@end

@implementation DisTwoViewController

- (void)popBtnAction {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backView.backgroundColor = [UIColor whiteColor];
    
    _scrollView = [[XYYScrollView alloc] initWithFrame:CGRectMake(0, GlobalNavHeight, SCREEN_WIDTH, SCREEN_HEIGHT - GlobalNavHeight)];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    [self.backView addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2.0, SCREEN_HEIGHT - GlobalNavHeight);
    
    UIView *oneView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - GlobalNavHeight)];
    oneView.backgroundColor = [UIColor blueColor];
    [_scrollView addSubview:oneView];
    
    UIView *twoView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT - GlobalNavHeight)];
    twoView.backgroundColor = [UIColor greenColor];
    [_scrollView addSubview:twoView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 50, 50);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"POP" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [oneView addSubview:btn];
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
