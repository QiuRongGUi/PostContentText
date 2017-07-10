//
//  PostContentTextView.m
//  PostContentText
//
//  Created by QIUGUI on 2017/7/10.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//

#import "PostContentTextView1.h"
#import "UIView+Tool.h"

@implementation PostContentTextView1

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor whiteColor];
        
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(change:) name:UITextViewTextDidChangeNotification object:self];
    }
    return self;
}

- (void)change:(NSNotification *)sends{
    
    
    self.placeholderLable.hidden = self.hasText;
    
}
- (UILabel *)placeholderLable{
    if(!_placeholderLable){
        
        _placeholderLable = [[UILabel alloc] init];
        _placeholderLable.text = _placeholderText ? _placeholderText : @"分享...";
        _placeholderLable.textColor = _placeholderTextColor ? _placeholderTextColor:[UIColor grayColor];
        [_placeholderLable sizeToFit];
        [self addSubview:_placeholderLable];
        
    }
    return _placeholderLable;
}

- (void)setPlaceholderText:(NSString *)placeholderText{
    
    _placeholderText = placeholderText;
}
- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor{
    
    _placeholderTextColor = placeholderTextColor;
}

- (void)setText:(NSString *)text{
    
    [super setText:text];
    
    self.placeholderLable.hidden = text.length;
    
}
- (void)setFont:(UIFont *)font{
    [super setFont:font];
    
    self.placeholderLable.font = font;
    [self.placeholderLable sizeToFit];
}
- (void)setTextColor:(UIColor *)textColor{
    [super setTextColor:textColor];
    
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    self.placeholderLable.X = 2;
    self.placeholderLable.Y = 5;
    
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}


@end
