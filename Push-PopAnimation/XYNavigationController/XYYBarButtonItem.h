//
//  XYYBarButtonItem.h
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYYBarButtonItem : UIView

- (instancetype)initWithImage:(UIImage *)image target:(id)target action:(SEL)action;
- (instancetype)initWithTitle:(NSString *)title target:(id)target action:(SEL)action;
- (instancetype)initWithCustomView:(UIView *)customView;

@end
