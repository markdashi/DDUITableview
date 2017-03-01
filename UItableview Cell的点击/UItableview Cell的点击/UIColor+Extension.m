//
//  UIColor+Extension.m
//  UItableview Cell的点击
//
//  Created by apple on 1/3/17.
//  Copyright © 2017年 mark. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)


+ (UIColor *)colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue{

    return [self colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}


+ (UIColor *)defaultColor{

   return  [self colorWithRed:188 green:188 blue:194];
}

@end
