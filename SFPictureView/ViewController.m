//
//  ViewController.m
//  SFPictureView
//
//  Created by lurich on 2022/8/15.
//

#import "ViewController.h"
#import "SFLookImageView.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *backImgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *backImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 200)];
    backImgView.contentMode = UIViewContentModeScaleAspectFit;
    backImgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://img2.baidu.com/it/u=835321525,1974857462&fm=253&app=138&size=w931&n=0&f=JPEG&fmt=auto?sec=1660669200&t=811b07b6c064ccd180fda3295c1d0f99"]]];
    [self.view addSubview:backImgView];
    backImgView.userInteractionEnabled = YES;
    [backImgView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lookImg:)]];
    backImgView.center = self.view.center;
    self.backImgView = backImgView;
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.backImgView.center = self.view.center;
}
- (void)lookImg:(UITapGestureRecognizer *)tap{
    UIImageView *imageView = (UIImageView *)tap.view;
    SFLookImageView *imgView = [[SFLookImageView alloc] initWithOldImageFrame:imageView.frame ShowImage:imageView.image];
    imgView.finishDone = ^{
        NSLog(@"展示结束");
        imageView.hidden = NO;
    };
    [imgView show];
    imageView.hidden = YES;
}


@end
