//
//  PGQVoiceTopView.m
//  pgqVoiceInput
//
//  Created by ios on 16/7/14.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQVoiceTopView.h"
#import "PQVoiceInput.h"
@interface PQVoiceTopView ()

/**
 *  话筒线的view
 */
@property (nonatomic,strong) UIView * outsideLineView;
/**
 *  话筒线的layer
 */
@property (nonatomic,strong,nullable) CAShapeLayer * outsideLineLayer;
/**
 *  话筒view
 */
@property (nonatomic,strong) UIView * colidView;
/**
 *  话筒layer
 */
@property (nonatomic,strong,nullable) CAShapeLayer * colidLayer;
/**
 *  圆弧view
 */
@property (nonatomic,strong) UIView * arcView;
/**
 *  圆弧layer
 */
@property (nonatomic,strong,nullable) CAShapeLayer * arcLayer;
/**
 *  线宽
 */
@property (nonatomic,assign) CGFloat lineWidth;
/**
 *  线的颜色
 */
@property (nonatomic,strong) UIColor * lineColor;
/**
 *  话筒颜色
 */
@property (nonatomic,strong) UIColor * colidColor;

@end

@implementation PQVoiceTopView

- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth linceColor:(UIColor*)lColor colidColor:(UIColor*)cColor;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.lineColor = lColor;
        self.colidColor = cColor;
        self.lineWidth = lineWidth;
        [self setUp];
        
    }
    return self;
}

- (void)setUp{
    
    //话筒内部
    self.colidView = [[UIView alloc] initWithFrame:CGRectMake(self.width*0.38, self.height*0.15, self.width*0.24, self.height*0.7)];
    self.colidView.layer.cornerRadius = self.colidView.width*0.4;
    self.colidView.clipsToBounds = YES;
    self.colidLayer = [self drawOutSideLine:CGRectMake(0, 0, self.colidView.width, 0) color:self.colidColor isFill:YES];
    [self.colidView.layer addSublayer:self.colidLayer];
    [self addSubview:self.colidView];
    
    //话筒边框
    self.outsideLineView = [[UIView alloc] initWithFrame:CGRectMake(self.width*0.38, self.height*0.15, self.width*0.24, self.height*0.7)];
    self.outsideLineLayer = [self drawOutSideLine:CGRectMake(0, 0, self.outsideLineView.width, self.outsideLineView.height) color:self.lineColor isFill:NO];
    [self.outsideLineView.layer addSublayer:self.outsideLineLayer];
    [self addSubview:self.outsideLineView];
    
    
//    NSLog(@"---%f",self.width);
    
    //话筒弧
    self.arcView = [[UIView alloc] initWithFrame:CGRectMake(0, self.height*0.09, self.width, self.height*0.6)];
    self.arcLayer = [self drawARCLine:self.arcView.center frame:self.arcView.frame color:self.lineColor];
    [self.arcView.layer addSublayer:self.arcLayer];
    [self addSubview:self.arcView];
}


- (CAShapeLayer*)drawARCLine:(CGPoint)point frame:(CGRect)frame color:(UIColor*)color{
    CAShapeLayer * Layer = [CAShapeLayer new];
    Layer.fillColor = nil; //这个是填充颜色
    Layer.strokeColor = color.CGColor; //这个边框颜色
    Layer.frame = frame; //这个是大小
    Layer.lineWidth = self.lineWidth; //这个是线宽
    Layer.lineCap = kCALineCapRound; //这个我也不知道
    //这个就是画图
    Layer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(point.x, point.y) radius:frame.size.width*0.3 startAngle:PQ_RADIANS(-5) endAngle:PQ_RADIANS(185) clockwise:YES].CGPath;
    return Layer;
}

- (CAShapeLayer*)drawOutSideLine:(CGRect)frame color:(UIColor*)color isFill:(BOOL)fill {
    CAShapeLayer * Layer = [CAShapeLayer new];
    if (fill) {
        Layer.fillColor = color.CGColor;
        Layer.strokeColor = nil;
    }
    else{
        Layer.fillColor = nil; //这个是填充颜色
        Layer.strokeColor = color.CGColor; //这个边框颜色
    }
    
    Layer.frame = frame; //这个是大小
    Layer.lineWidth = self.lineWidth; //这个是线宽
    Layer.lineCap = kCALineCapRound; //这个我也不知道
    //这个就是画图
    Layer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, frame.size.width, frame.size.height)  cornerRadius:frame.size.width*0.4].CGPath;
    return Layer;
}


- (void)updateVoiceViewWithVolume:(float)volume{
    CGFloat height = self.colidView.height;
    CGFloat newHeight = height*volume;
    CGFloat width = self.colidView.width;
    
    //    NSLog(@"%f",newHeight);
    self.colidLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, height - newHeight , width , newHeight) cornerRadius:0].CGPath;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
