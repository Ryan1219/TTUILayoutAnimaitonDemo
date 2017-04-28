//
//  ViewController.m
//  UILayout实现动画
//
//  Created by zhang liangwang on 16/4/2.
//  Copyright © 2016年 zhangliangwang. All rights reserved.
//

#import "ViewController.h"


#define  SwitchModeKey  @"SwitchModeKey"

@interface ViewController ()

//该视图相对父视图的右边距离，把priority改为750
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redViewConstraint;
//俩个View之间的间距
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewSpaceConstraint;
//该视图相对父视图的右边距离，把priority改为750
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *orangeViewConstraint; //blue

@property (weak, nonatomic) IBOutlet UISwitch *modeSwitch;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self updateConstraintsForMode];
    
    
}


//根据开关状态布局constant和priority
- (void)updateConstraintsForMode
{
    
    if (self.modeSwitch.isOn) {
        
        self.viewSpaceConstraint.constant = 10.0;
        self.orangeViewConstraint.priority = UILayoutPriorityDefaultHigh + 1;
        
    } else {
        
        self.viewSpaceConstraint.constant = self.view.frame.size.width;
        self.orangeViewConstraint.priority = UILayoutPriorityDefaultHigh - 1;
    }
}


//开关的点击监听
- (IBAction)clickModeSwitch:(UISwitch *)sender {
    
    
    [[NSUserDefaults standardUserDefaults] setBool:sender.isOn forKey:SwitchModeKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.view layoutIfNeeded];
    [UIView animateWithDuration:1.0 animations:^{
        
        [self updateConstraintsForMode];
        [self.view layoutIfNeeded];
    }];
    
}




@end












































