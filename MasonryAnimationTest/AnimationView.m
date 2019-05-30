//
//  AnimationView.m
//  MasonryAnimation
//
//  Created by guodongdong on 2019/5/29.
//  Copyright © 2019 guodongdong. All rights reserved.
//


/**
 不能在- (void)layoutSubviews里布局UI,因为动画的时候会调用layoutIfNeeded方法
 
 修改约束有两种方式
 方法1
 第一种是直接使用
 [控件 mas_updateConstraints:^(MASConstraintMaker *make) {
 }];
 ，在block中写入新的约束就可以了
 
 方法2
 是添加全局的约束，然后在添加约束的时候赋值，在动画的代码中改值。
 @property (nonatomic, strong) MASConstraint *rightConstraint;
 添加约束的代码：
 [控件 mas_makeConstraints:^(MASConstraintMaker *make) {
 _rightConstraint=make.right.mas_equalTo(view.mas_right).offset(-20);
 }];
 动画里修改约束的代码
 self.rightConstraint.mas_equalTo(-100);
 以上就是对约束的修改方式。
 */

#import "AnimationView.h"
#import "Masonry.h"

/**
添加全局的约束
 */
@interface AnimationView ()

@property (nonatomic, strong) MASConstraint *centerYConstraint;

@end

@implementation AnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

- (void)btnClick {
    self.centerYConstraint.mas_equalTo(300);
    [UIView animateWithDuration:2 animations:^{
        [self layoutIfNeeded];
    }];
    
}

- (void)configUI {
    [self addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        self.centerYConstraint = make.centerY.mas_equalTo(0);
        make.width.height.mas_equalTo(50);
    }];
}

- (UIButton *)btn {
    if (_btn == nil) {
        _btn = [UIButton new];
        _btn.backgroundColor = [UIColor redColor];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

@end

/**
直接修改约束
 */
//@interface AnimationView ()
//
//
//@end
//
//@implementation AnimationView
//
//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        [self configUI];
//    }
//    return self;
//}
//
//- (void)btnClick {
//    [self.btn mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(300);
//    }];
//    [UIView animateWithDuration:2 animations:^{
//        [self layoutIfNeeded];
//    }];
//}
//
//- (void)configUI {
//    [self addSubview:self.btn];
//    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(0);
//        make.width.height.mas_equalTo(50);
//    }];
//}
//
//- (UIButton *)btn {
//    if (_btn == nil) {
//        _btn = [UIButton new];
//        _btn.backgroundColor = [UIColor redColor];
//        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _btn;
//}
//
//@end
