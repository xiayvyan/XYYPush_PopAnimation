

//设置整个View背景色
//    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.1f];
//设置文字颜色
//    hud.contentColor = [UIColor redColor];
//设置弹窗的背景色
//    hud.bezelView.backgroundColor = [UIColor greenColor];

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)
/**
 *  显示文字图片信息（成功、失败）
 */
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view;
/**
 *  下方显示文字信息
 */
+ (void)downText:(NSString *)text view:(UIView *)view;
/**
 *  快速显示文字信息
 */
+(void)qucickTip:(NSString *)text;
/**
 *  显示文字信息
 */
+(void)showMessage:(NSString *)text toView:(UIView *)view;

//关闭菊花
+ (void)closeHud:(UIView *)view;

@end
