//
//  KeyboardView.m
//  PostContentText
//
//  Created by QIUGUI on 2017/7/10.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//
#define Width  [UIScreen mainScreen].bounds.size.width

#import "KeyboardView.h"
#import "UIView+Tool.h"

@implementation KeyboardView



- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        
        /** 相机*/
        UIButton *camerabutton = [self createButtonWithImage:@"compose_camerabutton_background" highlightedImage:@"compose_camerabutton_background_highlighted"];
        /** 相机*/
        UIButton *emoticonbutton = [self createButtonWithImage:@"compose_emoticonbutton_background" highlightedImage:@"compose_emoticonbutton_background_highlighted"];

        /** keyboardbutton*/
        UIButton *keyboardbutton = [self createButtonWithImage:@"compose_keyboardbutton_background" highlightedImage:@"compose_keyboardbutton_background_highlighted"];

        /** mentionbutton*/
        UIButton *mentionbutton = [self createButtonWithImage:@"compose_mentionbutton_background" highlightedImage:@"compose_mentionbutton_background_highlighted"];
        
        /** picture*/
        UIButton *picture = [self createButtonWithImage:@"compose_toolbar_picture" highlightedImage:@"compose_toolbar_picture_highlighted"];
        
        /** trendbutton*/
        UIButton *trendbutton = [self createButtonWithImage:@"compose_trendbutton_background" highlightedImage:@"compose_trendbutton_background_highlighted"];

        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_toolbar_background"]];
        
               
    }
    return self;
}

- (UIButton *)createButtonWithImage:(NSString *)aImage  highlightedImage:(NSString *)highlightedaImage{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:aImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedaImage] forState:UIControlStateHighlighted];
    [self addSubview:button];

    return button;
}
- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat width = Width / self.subviews.count;
    
    for(int i = 0;i<self.subviews.count;i++){
        
        UIButton *but = self.subviews[i];
        but.X = width * i;
        but.Y = 0;
        but.width = width;
        but.height = self.height;
    }
    
}
@end
