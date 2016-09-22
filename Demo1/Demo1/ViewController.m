//
//  ViewController.m
//  Demo1
//
//  Created by alen on 16/9/19.
//  Copyright © 2016年 alen. All rights reserved.
//
#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate> {
@public
    UILabel *_label;
@public
    UIButton *_button;
}
@property(weak, nonatomic) IBOutlet UITextField *tf;
@property(strong, nonatomic) IBOutlet UISwitch *uiSwitch2;
@property(strong, nonatomic) IBOutlet UISlider *uiSlider;
@property(strong, nonatomic) IBOutlet UISegmentedControl *uiSegmentedControl;

- (IBAction)btnUp:(id)sender;


@end

@implementation ViewController

/**
 * 入口
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.frame = CGRectMake(100, 100, 100, 100);
    _button.backgroundColor = [UIColor whiteColor];
    [_button setTitle:@"点我呀" forState:UIControlStateNormal];
    [self.view addSubview:_button];
    [_button addTarget:self action:@selector(testActionSheet:) forControlEvents:UIControlEventTouchUpInside];


    UISwitch *uiSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(100, 500, 100, 30)];
    _uiSwitch2 = [[UISwitch alloc] initWithFrame:CGRectMake(100, 600, 100, 30)];
    [uiSwitch addTarget:self action:@selector(testActionSwitch:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:uiSwitch];
    [self.view addSubview:_uiSwitch2];

    _uiSlider = [[UISlider alloc] initWithFrame:CGRectMake(100, 350, 100, 30)];
    [self.view addSubview:_uiSlider];
    _uiSegmentedControl = [[UISegmentedControl alloc] init];
    _uiSegmentedControl.frame = CGRectMake(100,200,100,30);
    _uiSegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [_uiSegmentedControl insertSegmentWithTitle:@"消息" atIndex:0 animated:YES];
    [_uiSegmentedControl insertSegmentWithTitle:@"电话" atIndex:1 animated:YES];
    [_uiSegmentedControl setWidth:50 forSegmentAtIndex:0];
    _uiSegmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:_uiSegmentedControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnUp:(id)sender {
    _label.text = @"修改成功";
}

/**
 * 按钮点击
 * @param sender
 */
- (IBAction)click:(UIButton *)sender {
    [sender setTitle:@"点击啦" forState:UIControlStateNormal];
}

/**
 * textField与键盘
 * @param textField
 * @return
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

/**
 * TextView跟键盘之间
 * @param textView
 * @param range
 * @param text
 * @return
 */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

/**
 * 底部操作栏
 * @param sender
 */
- (IBAction)testActionSheet:(id)sender {
    UIAlertController *alertCon = [[UIAlertController alloc] init];

    UIAlertAction *cacel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *ddd = [UIAlertAction actionWithTitle:@"破坏" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"破坏的");
    }];
    UIAlertAction *defalut = [UIAlertAction actionWithTitle:@"微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"微信");
    }];
    [alertCon addAction:cacel];
    [alertCon addAction:ddd];
    [alertCon addAction:defalut];
    [self presentViewController:alertCon animated:YES completion:nil];
}

- (IBAction)testActionSwitch:(id)sender {
    UISwitch *uiSwitch = (UISwitch *) sender;
    BOOL isOn = uiSwitch.isOn;
    [uiSwitch setOn:isOn];
    [_uiSwitch2 setOn:isOn animated:YES];
}

@end
