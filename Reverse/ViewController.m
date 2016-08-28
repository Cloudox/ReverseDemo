//
//  ViewController.m
//  Reverse
//
//  Created by Cloudox on 16/8/28.
//  Copyright © 2016年 Cloudox. All rights reserved.
//

#import "ViewController.h"
#import "CommentViewController.h"

//设备的宽高
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];// 背景设为黑色
    
    // 图片
    UIImageView *myImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, (SCREENHEIGHT - SCREENWIDTH + 100) / 2, SCREENWIDTH, SCREENWIDTH - 100)];
    myImage.image = [UIImage imageNamed:@"image.jpg"];
    [self.view addSubview:myImage];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH - 100, SCREENHEIGHT - 50, 80, 30)];
    label.text = @"查看评论";
    label.textColor = [UIColor whiteColor];
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *labelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewComment)];
    [label addGestureRecognizer:labelTap];
    [self.view addSubview:label];
}

// 查看评论
- (void)viewComment {
    CommentViewController *commentVC = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:commentVC animated:NO];
    [UIView transitionWithView:self.navigationController.view duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
