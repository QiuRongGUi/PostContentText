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
#import "PostContentTextView2.h"
#import "KeyboardView.h"

#import "UIView+Tool.h"

@interface PostViewController (){
    
    PostContentTextView1 *textView1;
    PostContentTextView2 *textView2;
    KeyboardView *key;
    
}

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(change)];
    
    
    [self setContentView1];
    
    [textView1 becomeFirstResponder];
    
//    [self setContentView2];
//    [textView2 becomeFirstResponder];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
    NSLog(@"%f---sends1",Height);

}

- (void)keyChange:(NSNotification *)sends{
    
    NSLog(@"%@---sends1",sends.userInfo);
    NSDictionary *dic = sends.userInfo;
    
    double duration = [dic[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect rect = [dic[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    [UIView animateWithDuration:duration animations:^{
       
        key.Y = rect.origin.y - 44;
     
    }];
    
}
//- (void)setContentView2{
//    
//    textView2 = [[PostContentTextView2 alloc] init];
//    textView2.frame = CGRectMake(Margen, Margen + 64, Width - Margen * 2, 200);
//    textView2.placeholderText = @"分享123 ....";
//    textView2.placeholderTextColor = [UIColor redColor];
//    [self.view addSubview:textView2];
//    //    
//
//    
//}

- (void)change{
    
    textView1.text = @"123434344-----";
//    textView2.font = [UIFont systemFontOfSize:20];
    
    
}

- (void)setContentView1{
    
    
    textView1 = [[PostContentTextView1 alloc] init];
    textView1.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    textView1.alwaysBounceVertical = YES;
    textView1.frame = CGRectMake(Margen, Margen + 64, Width - Margen * 2, 200);
    [self.view addSubview:textView1];
    
    
    key = [[KeyboardView alloc] init];
//    key.frame =  CGRectMake(0, 0, Width, 44);
    key.X = 0;
    key.Y = self.view.height - 44;
    key.width = Width;
    key.height = 44;
    [self.view addSubview:key];    
}


@end
