//
//  PostViewController.m
//  PostContentText
//
//  Created by QIUGUI on 2017/7/10.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//
#define Height  [UIScreen mainScreen].bounds.size.height
#define Width  [UIScreen mainScreen].bounds.size.width
#define Margen 5

#import "PostViewController.h"

#import "PostContentTextView1.h"
#import "UIView+Tool.h"

@interface PostViewController (){
    
    PostContentTextView1 *textView;
    
}

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(change)];
    
    
    [self setContentView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeText:) name:UITextViewTextDidChangeNotification object:nil];
    
}
- (void)changeText:(NSNotification *)sends{
    
    textView.placeholderLable.hidden = textView.text.length;
    
}
- (void)change{
    
//    textView.text = @"123434344-----";
    textView.font = [UIFont systemFontOfSize:20];
    
}
- (void)setContentView{
    
    
    textView = [[PostContentTextView1 alloc] init];
    textView.frame = CGRectMake(Margen, Margen + 64, Width - Margen * 2, 200);
    [self.view addSubview:textView];
    
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self];
    
}
@end
