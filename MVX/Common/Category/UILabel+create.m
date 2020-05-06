//
//  UILabel+create.m
//  XTrip
//
//  Created by 张胜瀚 on 16/3/29.
//  Copyright © 2016年 xiafeitu. All rights reserved.
//

#import "UILabel+create.h"

@implementation UILabel (create)
//返回 通用label
+ (UILabel  *)creatNormalLabel:(UIColor *)textColor align:(NSTextAlignment)textAlignment font:(UIFont *)textFont text:(NSString *)text
{
    UILabel *commonLabel = [[UILabel alloc] init];
    
    if (textColor != nil) {
        commonLabel.textColor = textColor;
    }
    
    commonLabel.textAlignment = textAlignment;
    
    if (textFont) {
        commonLabel.font = textFont;
    }
    
    commonLabel.text = text;
    
    return commonLabel;
}
@end
