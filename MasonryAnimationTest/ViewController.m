//
//  ViewController.m
//  MasonryAnimationTest
//
//  Created by guodongdong on 2019/5/29.
//  Copyright © 2019 guodongdong. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"
#import "Masonry.h"
#import "CABasicAnimationView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    AnimationView *ani = [AnimationView new];
//    [self.view addSubview:ani];
//    [ani mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(0);
//    }];
    
    CABasicAnimationView *basicAnimationView = [CABasicAnimationView new];
    [self.view addSubview:basicAnimationView];
    
    [basicAnimationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}


@end
