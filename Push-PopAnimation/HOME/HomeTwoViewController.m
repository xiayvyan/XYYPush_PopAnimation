//
//  HomeTwoViewController.m
//  demo
//
//  Created by  Forfarming on 2017/12/18.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "HomeTwoViewController.h"
#import "HomeThreeViewController.h"

@interface HomeTwoViewController ()

@end

@implementation HomeTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backView.backgroundColor = [UIColor purpleColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, GlobalNavHeight, SCREEN_WIDTH, 45);
    [btn setTitle:@"Present" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:btn];
    
    if (self.image) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, GlobalNavHeight + 50, SCREEN_WIDTH, SCREEN_HEIGHT - GlobalNavHeight - 50)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = self.image;
        [self.backView addSubview:imageView];
    }
}

- (void)presentAction {
    HomeThreeViewController *vc = [[HomeThreeViewController alloc] init];
    [self presentViewController:vc animated:YES completion:NULL];
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
