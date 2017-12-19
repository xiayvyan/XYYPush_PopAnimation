//
//  UIButton+Size.h
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Size)

+ (CGSize) boundingRectWithSize:(NSString*)txt Font:(UIFont*)font Size:(CGSize)size;

@end
