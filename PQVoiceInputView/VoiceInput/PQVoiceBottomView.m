//
//  PGQVoiceBottomView.m
//  pgqVoiceInput
//
//  Created by ios on 16/7/14.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQVoiceBottomView.h"

#import "PQVoiceInput.h"

@interface PQVoiceBottomView ()
/**
 *  中间线view
 */
@property (nonatomic,strong) UIView * cenLineView;
/**
 *  中间线layer
 */
@property (nonatomic,strong) CAShapeLayer * cenLineLayer;
/**
 *  底部线view
 */
@property (nonatomic,strong) UIView * bomLineView;
/**
 *  底部线layer
 */
@property (nonatomic,strong) CAShapeLayer * bomLineLayer;
/**
 *  线宽
 */
@property (nonatomic,assign) CGFloat lineWidth;
/**
 *  线的颜色
 */
@property (nonatomic,strong) UIColor * lineColor;
@end

@implementation PQVoiceBottomView


- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lindeColor:(UIColor*)lineColor
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.lineWidth = lineWidth;
        self.lineColor = lineColor;
        
        [self setUp];
        
    }
    return self;
}


- (void)setUp{
    
    self.cenLineView = [[UIView alloc]initWithFrame:CGRectMake(self.width/2 - self.lineWidth/2, 0, self.lineWidth, self.height*0.6)];
    self.cenLineLayer = [self drawOutSideLine:self.cenLineView.bounds color:self.lineColor];
    [self.cenLineView.layer addSublayer:self.cenLineLayer];
    [self addSubview:self.cenLineView];
    
    self.bomLineView = [[UIView alloc]initWithFrame:CGRectMake(self.width*0.3, self.height*0.6 - self.lineWidth/2, self.width*0.4, self.lineWidth)];
    self.cenLineLayer = [self drawOutSideLine:self.bomLineView.bounds color:self.lineColor];
    [self.bomLineView.layer addSublayer:self.cenLineLayer];
    [self addSubview:self.bomLineView];
    
}

- (CAShapeLayer*)drawOutSideLine:(CGRect)frame color:(UIColor*)color{
    CAShapeLayer * Layer = [CAShapeLayer new];
    Layer.fillColor = color.CGColor; //这个是填充颜色
    Layer.strokeColor = nil; //这个边框颜色
    Layer.frame = frame; //这个是大小
    Layer.lineWidth = self.lineWidth; //这个是线宽
    Layer.lineCap = kCALineCapRound; //这个我也不知道
    //这个就是画图
    Layer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, frame.size.width, frame.size.height)  cornerRadius:frame.size.width*0.4].CGPath;
    return Layer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
