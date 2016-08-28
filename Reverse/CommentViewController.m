//
//  CommentViewController.m
//  Reverse
//
//  Created by Cloudox on 16/8/28.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "CommentViewController.h"

//设备的宽高
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];// 背景色设为白色
    
    // 自定义导航栏按钮
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    // 图片
    UIImageView *myImage = [[UIImageView alloc] initWithFrame:CGRectMake((SCREENWIDTH - 300)/2, (SCREENHEIGHT - 200)/2 - 100, 300, 200)];
    myImage.image = [UIImage imageNamed:@"image.jpg"];
    [self.view addSubview:myImage];
    
    // 一条文本
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((SCREENWIDTH - 200)/2, myImage.frame.origin.y + myImage.frame.size.height + 20, 200, 30)];
    label.text = @"100个赞，100条评论";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

// 返回上一页
- (void)back {
    // 设置翻转动画为从左边翻上来
    [UIView transitionWithView:self.navigationController.view duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
