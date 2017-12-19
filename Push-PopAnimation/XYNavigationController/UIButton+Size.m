//
//  UIButton+Size.m
//  demo
//
//  Created by  Forfarming on 2017/12/14.
//  Copyright © 2017年  Forfarming. All rights reserved.
//

#import "UIButton+Size.h"

@implementation UIButton (Size)

/*
 txt:label或button的title
 font:字体大小
 size:允许最大size
 */
+(CGSize)boundingRectWithSize:(NSString*) txt Font:(UIFont*) font Size:(CGSize) size {
    
    CGSize _size;
    
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    NSStringDrawingOptions options = NSStringDrawingTruncatesLastVisibleLine |
    
    NSStringDrawingUsesLineFragmentOrigin |
    
    NSStringDrawingUsesFontLeading;
    
    _size = [txt boundingRectWithSize:size options: options attributes:attribute context:nil].size;
    
#else
    
    _size = [txt sizeWithFont:font constrainedToSize:size];
    
#endif
    
    return _size;
    
}

@end
