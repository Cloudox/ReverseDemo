# ReverseDemo
仿微信相册的页面翻转过渡动画

点开微信相册的时候，想要在相册图片界面跳转查看点赞和评论时，微信会采用界面翻转的过渡动画来跳转到评论界面，好像是在图片界面的背面一样，点击完成又会翻转回到图片界面，这不同于一般的导航界面滑动动画，觉得很有意思，于是自己学着做了一下，其实也很简单，下面是实现的类似的效果图：

![](https://github.com/Cloudox/ReverseDemo/blob/master/ReverseDemo.gif)

在图片界面点击右下角的查看评论会翻转到评论界面，评论界面点击左上角的返回按钮会反方向翻转回图片界面，真正的实现方法，与传统的导航栏过渡其实只有一行代码的区别，让我们来看看整体的实现。

首先我们实现图片界面，这个界面上有黑色的背景，一张图片和一个查看评论的按钮：

```objective-c
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];// 背景设为黑色
    
    // 图片
    UIImageView *myImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, (SCREENHEIGHT - SCREENWIDTH + 100) / 2, SCREENWIDTH, SCREENWIDTH - 100)];
    myImage.image = [UIImage imageNamed:@"image.jpg"];
    [self.view addSubview:myImage];
    
    // 右下角查看评论的按钮
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH - 100, SCREENHEIGHT - 50, 80, 30)];
    label.text = @"查看评论";
    label.textColor = [UIColor whiteColor];
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *labelTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewComment)];
    [label addGestureRecognizer:labelTap];
    [self.view addSubview:label];
}
```

到这里其实都没什么特别的，现在来看看查看评论文字的点击响应，也就是跳转的实现：

```objective-c
// 查看评论
- (void)viewComment {
    CommentViewController *commentVC = [[CommentViewController alloc] init];
    [self.navigationController pushViewController:commentVC animated:NO];
    // 设置翻页动画为从右边翻上来
    [UIView transitionWithView:self.navigationController.view duration:1 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil];
}
```

可以看到，就是比普通的push多了一行代码而已，原本的push部分我们的animated参数要设为NO，然后再行设置翻转的动画即可，这里options的参数可以看出，动画是从右边开始翻转的，duration表示动画时间，很简单地就实现了翻转到评论界面。

我们再看看评论界面的代码，界面元素上有一个返回按钮，一个图片，一行文字，但是这个返回按钮的特殊在于，我们重新定义了导航栏的返回按钮，如果什么都不做，导航栏其实会自带一个带箭头的返回按钮，点击后就是正常的滑动回上一个界面，这里我们要用我们自己的按钮来取代它：

```objective-c
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
```

可以看到，我们自定义了一个UIBarButtonItem按钮，然后用它放在导航栏的leftBarButtonItem的位置，这样就取代了原本的返回按钮了，然后在按钮点击响应中去设置翻转动画：

```objective-c
// 返回上一页
- (void)back {
    // 设置翻转动画为从左边翻上来
    [UIView transitionWithView:self.navigationController.view duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:nil completion:nil];
    [self.navigationController popViewControllerAnimated:NO];
}
```

还是一样的，不过这次要先设置动画，再进行pop，否则没有效果，而且pop的动画参数也要设为NO，可以看到这次的options的参数是从左边开始翻转，在视觉上就有一个反方向翻回去的效果。

以上，就是该过渡动画的全部实现过程了，其实无非就是加了两行代码而已，非常简单，但是偶尔用一下，还是能带来非常好的效果的~

查看[我的博客](http://blog.csdn.net/cloudox_/article/details/52347042)获取更多内容
