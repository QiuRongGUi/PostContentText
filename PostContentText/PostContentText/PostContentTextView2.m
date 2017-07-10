//
//  PostContentTextView2.m
//  PostContentText
//
//  Created by QIUGUI on 2017/7/10.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//

#import "PostContentTextView2.h"
#import "UIView+Tool.h"

@implementation PostContentTextView2

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor cyanColor];
     
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeText:) name:UITextViewTextDidChangeNotification object:self];
        
    }
    return self;
}
- (void)changeText:(NSNotification *)sends{
    
    [self setNeedsDisplay];
    
    NSLog(@"change-----");
    
}
- (void)setText:(NSString *)text{
    [super setText:text];
    [self setNeedsDisplay];

}

- (void)setFont:(UIFont *)font{
    [super setFont:font];
    [self setNeedsDisplay];

}
- (void)setPlaceholderText:(NSString *)placeholderText{
    
    _placeholderText = [placeholderText copy];
    
    [self setNeedsDisplay];

}
- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor{
    
    _placeholderTextColor = placeholderTextColor;
    
    [self setNeedsDisplay];

}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
  
    if(self.hasText){
        
        return;
    }
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.font;
    attrs[NSForegroundColorAttributeName] = self.placeholderTextColor?self.placeholderTextColor:[UIColor grayColor];
    
    CGFloat x = 5;
    CGFloat y = 5;
    CGFloat w = rect.size.width - 2 * x;
    CGFloat h = rect.size.height - 2 * y;
    CGRect placeholderRect = CGRectMake(x, y, w, h);
    [self.placeholderText drawInRect:placeholderRect withAttributes:attrs];

}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}

@end
