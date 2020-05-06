//
//  CWHomeViewController.m
//  MVX
//
//  Created by caowei on 2020/5/2.
//  Copyright © 2020 caowei. All rights reserved.
//

#import "CWHomeViewController.h"
#import "CWMVCViewController.h"
#import "CWMVPViewController.h"
#import "CWMVVMViewController.h"

@interface CWHomeViewController ()

@property (nonatomic ,strong) NSArray *titleArray;

@end

@implementation CWHomeViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVX";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
}

#pragma mark - private UI

- (void)setupUI {
    for (int i = 0; i < 3; i++) {
        UIButton * btn = [[UIButton alloc] init];
        btn.tag = 100 + i;
        btn.frame = CGRectMake(0, 100 * (i + 1), ScreenWidth, 100);
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor grayColor];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pushToNextVC:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

#pragma mark - overwrite

#pragma mark - public

#pragma mark - private

#pragma mark - request

#pragma mark - delegate

#pragma mark - notification

#pragma mark - event response

- (void)pushToNextVC:(UIButton *)button {
    switch (button.tag) {
        case 100:
            {
                CWMVCViewController *vc = [[CWMVCViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
        case 101:
           {
               CWMVPViewController *vc = [[CWMVPViewController alloc] init];
               [self.navigationController pushViewController:vc animated:YES];
           }
            break;
        case 102:
            {
                CWMVVMViewController *vc = [[CWMVVMViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
        default:
            
            break;
    }
}

#pragma mark - getter and setter

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"MVC",@"MVP",@"MVVM"];
    }
    return _titleArray;
}

@end
