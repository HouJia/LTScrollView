//
//  LTHeaderView.m
//  OCExample
//
//  Created by 高刘通 on 2018/4/19.
//  Copyright © 2018年 LT. All rights reserved.
//
//  如有疑问，欢迎联系本人QQ: 1282990794
//
//  ScrollView嵌套ScrolloView解决方案（初级、进阶)， 支持OC/Swift
//
//  github地址: https://github.com/gltwy/LTScrollView
//
//  clone地址:  https://github.com/gltwy/LTScrollView.git
//

#import "LTHeaderView.h"

@interface LTHeaderView ()<UIGestureRecognizerDelegate>
@property(strong, nonatomic) UILabel *testLabel;
@property(strong, nonatomic) UIScrollView *testScrollView;
@property(strong, nonatomic)UITapGestureRecognizer *gesture;
@end

@implementation LTHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

// 暂时只支持直接子类的响应
- (void)viewDidTap:(UIView *)view atPotin:(CGPoint)location{
    UIView *hitView = nil;
    for (UIView *view in self.subviews) {
        CGPoint newlocation = [view convertPoint:location fromView:self];
        if (CGRectContainsPoint(view.bounds, newlocation)) {
            hitView = view;
            break;
        }
    }

    if (hitView) {
        [self tagGesture:self.gesture];
    }
}

#pragma mark - 布局子视图
-(void)setupSubviews {
    self.backgroundColor = [UIColor blueColor];
    [self addSubview:self.testScrollView];
    [self addSubview:self.testLabel];
}

-(void)tagGesture:(UITapGestureRecognizer *)gesture {
    NSLog(@"响应事件，回调自己处理吧。");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    CGPoint newPoint = [self.testScrollView convertPoint:point fromView:self];
    if (CGRectContainsPoint(self.testScrollView.bounds, newPoint)) {
        return self.testScrollView;
    }else{
        return nil;
    }
}

-(UIScrollView *)testScrollView {
    if (!_testScrollView) {
        _testScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)/2.f)];
        _testScrollView.showsHorizontalScrollIndicator = YES;
        for (UIGestureRecognizer *gr in _testScrollView.gestureRecognizers) {
            NSLog(@"%@ 的 代理是: %@",gr,gr.delegate.class);
        }
        _testScrollView.alwaysBounceHorizontal = YES;
        UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 300, 70)];
        testView.backgroundColor = [UIColor orangeColor];
        [_testScrollView addSubview:testView];
        _testScrollView.backgroundColor = [UIColor greenColor];
    }
    return _testScrollView;
}

-(UILabel *)testLabel {
    if (!_testLabel) {
        _testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.testScrollView.frame)+10, 300, 70)];
        _testLabel.text = @"点击响应事件";
        _testLabel.backgroundColor = [UIColor grayColor];
        _testLabel.textColor = [UIColor whiteColor];
    }
    return _testLabel;
}

@end
