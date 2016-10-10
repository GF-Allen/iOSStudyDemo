//
//  ViewController.m
//  MasonryDemo1
//
//  Created by alen on 16/9/22.
//  Copyright (c) 2016 alenbeyond. All rights reserved.
//


#import "ViewController.h"
#import "Masonry.h"


@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    // Do any additional setup after loading the view, typically from a nib.

    UIView *toolbarView = [[UIView alloc] init];
    toolbarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:toolbarView];
    [toolbarView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view).multipliedBy(1);
        make.height.equalTo(@64);
    }];

    //车险信息View
    UIView *backgroundView = [[UIView alloc] init];//车辆View
    backgroundView.backgroundColor = [UIColor whiteColor];
    backgroundView.layer.masksToBounds = YES;
    backgroundView.layer.cornerRadius = 6;
    [self.view addSubview:backgroundView];
    [backgroundView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(toolbarView.mas_bottom).offset(10);
        make.height.equalTo(@300);
    }];

    UIImage *vehLogo = [UIImage imageNamed:@"bt-p"];
    UIImageView *vehLogoView = [[UIImageView alloc] initWithImage:vehLogo highlightedImage:nil];
    vehLogoView.contentMode =UIViewContentModeScaleAspectFit;
    [backgroundView addSubview:vehLogoView];
    [vehLogoView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(10);
        make.width.and.height.mas_equalTo(50);
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end