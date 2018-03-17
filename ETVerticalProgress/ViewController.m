//
//  ViewController.m
//  ETVerticalProgress
//
//  Created by Ethan on 2018/3/17.
//  Copyright © 2018年 Ethan. All rights reserved.
//

#import "ViewController.h"
#import "ETVerticalProgress.h"

@interface ViewController ()

@property (nonatomic, strong) ETVerticalProgress *etView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_etView = [[ETVerticalProgress alloc]initWithFrame:CGRectMake(0, 0, 70, 300)];
	_etView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
	[self.view addSubview:_etView];
}

- (IBAction)tapEvent:(UIButton *)sender {
	_etView.progress += 0.2;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
