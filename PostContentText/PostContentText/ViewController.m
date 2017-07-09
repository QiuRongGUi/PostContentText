//
//  ViewController.m
//  PostContentText
//
//  Created by QIUGUI on 2017/7/10.
//  Copyright © 2017年 QIUGUI. All rights reserved.
//

#import "ViewController.h"
#import "PostViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}
- (IBAction)post:(id)sender {
    
    PostViewController *post = [[PostViewController alloc] init];
    [self.navigationController pushViewController:post animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
