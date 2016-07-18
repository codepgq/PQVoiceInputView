//
//  PGQCirecleAnimationView.m
//  pgqVoiceInput
//
//  Created by ios on 16/7/15.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQCircleAnimationView.h"
#import "PQVoiceInput.h"
@interface PQCircleAnimationView ()

@property (nonatomic,assign) CGFloat lineWidth;
@property (nonatomic,strong) UIColor * lineColor;
@property (nonatomic,strong) NSTimer * timer;
@property (nonatomic,assign) NSTimeInterval time;

@end

@implementation PQCircleAnimationView

- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lindeColor:(UIColor *)lineColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.lineColor = lineColor;
        self.lineWidth = lineWidth;
        [self setUp];
    }
    return self;
}


- (void)setUp{
//    self.circleView1 = [[PGQVoiceCircleView alloc]initWithFrame:self.bounds lineWidth:self.lineWidth lindeColor:self.lineColor size:0.5];
//    [self addSubview:self.circleView1];
//    
//    self.circleView2 = [[PGQVoiceCircleView alloc]initWithFrame:self.bounds lineWidth:self.lineWidth lindeColor:self.lineColor size:0.5];
//    [self addSubview:self.circleView2];
//    
//    self.circleView3 = [[PGQVoiceCircleView alloc]initWithFrame:self.bounds lineWidth:self.lineWidth lindeColor:self.lineColor size:0.5];
//    [self addSubview:self.circleView3];
}

- (void)startAnimation{
    [self closeTimer];
    [self openTimer];
}
- (void)stopAnimation{
    [self closeTimer];
}

- (void)openTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.8 target:self selector:@selector(createLayer) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)createLayer{
//    [self addLayer];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self addLayer];
//    });
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self addLayer];
//    });
    
    [self createLayerWayTwo:1.f];
    [self createLayerWayTwo:1.75f];
//    [self createLayerWayTwo:2.75f];
//    [self createLayerWayTwo:3.85f];
}

- (void)createLayerWayTwo:(float)duration{

    
    __block PQVoiceCircleView *circleView = [[PQVoiceCircleView alloc]initWithFrame:self.bounds lineWidth:self.lineWidth lindeColor:self.lineColor size:0.5];
    [self addSubview:circleView];
    
//    [UIView animateWithDuration:duration animations:^{
//        circleView.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
//        circleView.layer.opacity = 0;
//    } completion:^(BOOL finished) {
//        [circleView removeFromSuperview];
//    }];
    
    [UIView animateWithDuration:duration delay:0 options:(UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction) animations:^{
        circleView.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
        circleView.layer.opacity = 0;
    } completion:^(BOOL finished) {
        [circleView removeFromSuperview];
    }];
}

- (void)addLayer{
    __block PQVoiceCircleView *circleView = [[PQVoiceCircleView alloc]initWithFrame:self.bounds lineWidth:self.lineWidth lindeColor:self.lineColor size:0.5];
    [self addSubview:circleView];
    
    [UIView animateWithDuration:0.9f animations:^{
        circleView.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1.5);
        circleView.layer.opacity = 0;
    } completion:^(BOOL finished) {
        [circleView removeFromSuperview];
    }];
}

- (void)closeTimer{
    [self.timer setFireDate:[NSDate distantFuture]];
    [self.timer invalidate];
    self.timer = nil;
    
    for (PQVoiceCircleView * view in self.subviews) {
        [view removeFromSuperview];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
