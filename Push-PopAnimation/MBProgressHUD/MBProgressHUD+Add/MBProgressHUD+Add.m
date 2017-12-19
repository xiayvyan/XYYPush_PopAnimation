//设置整个View背景色
//    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.1f];
//设置文字颜色
//    hud.contentColor = [UIColor redColor];
//设置弹窗的背景色
//    hud.bezelView.backgroundColor = [UIColor greenColor];

#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)

#pragma mark - 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = text;
    UIImage *image = [[UIImage imageNamed:icon] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES; 
    [hud hideAnimated:YES afterDelay:1.5];
}

#pragma mark - 下方显示文字信息
+ (void)downText:(NSString *)text view:(UIView *)view
{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    [hud hideAnimated:YES afterDelay:1.5];
}
#pragma mark - 快速显示文字信息
+(void)qucickTip:(NSString *)text{
    UIView *view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode=MBProgressHUDModeText;
    hud.label.text=text;
    [hud hideAnimated:YES afterDelay:0.5];
}
#pragma mark - 显示文字信息
+(void)showMessage:(NSString *)text toView:(UIView *)view{
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode=MBProgressHUDModeText;
    hud.label.text=text;
    [hud hideAnimated:YES afterDelay:1.5];
}
#pragma mark 关闭菊花
+ (void)closeHud:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
