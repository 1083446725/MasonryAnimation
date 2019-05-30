

#import "CABasicAnimationView.h"
#import "Masonry.h"

@implementation CABasicAnimationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}

- (void)btnClick {
    // 创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    // 设置动画的属性
    anim.keyPath = @"transform.scale";
    // 设置属性改变的值
    anim.toValue = @0.5;
    
    // 设置动画时长
    anim.duration = 0.25;
    
    // 取消反弹
    // 动画执行完毕之后不要把动画移除
    anim.removedOnCompletion = NO;
    
    // 保持最新的位置
    anim.fillMode = kCAFillModeForwards;
    
    // 重复动画的次数
    anim.repeatCount = MAXFLOAT;
    
    // 给图层添加了动画
    [self.btn.layer addAnimation:anim forKey:nil];
}

- (void)configUI {
    [self addSubview:self.btn];
    [self.btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
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

