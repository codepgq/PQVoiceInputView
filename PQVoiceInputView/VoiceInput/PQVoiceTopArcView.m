//
//  PGQVoiceTopArcView.m
//  pgqVoiceInput
//
//  Created by ios on 16/7/15.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQVoiceTopArcView.h"
#import "PQVoiceInput.h"
@interface PQVoiceTopArcView ()


@property (nonatomic,assign) CGFloat lineWidth;
@property (nonatomic,strong) UIColor * lineColor;
@property (nonatomic,assign) float  size;
@end

@implementation PQVoiceTopArcView

- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lindeColor:(UIColor *)lineColor size:(CGFloat)size
{
    self = [super initWithFrame:frame];
    if (self) {
        self.lineWidth = lineWidth;
        self.lineColor = lineColor;
        self.size = size;
        //        self.backgroundColor = [UIColor blueColor];
        self.layer.cornerRadius = self.width / 2;
        [self setUp];
    }
    return self;
}

- (void)setUp{
    self.circleLayer = [CAShapeLayer new];
    self.circleLayer.lineWidth = self.lineWidth*0.5;
    self.circleLayer.fillColor = nil;
    self.circleLayer.strokeColor = self.lineColor.CGColor;
    self.circleLayer.frame = self.bounds;
    self.circleLayer.lineCap = kCALineCapRound;
    self.circleLayer.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.width/2, self.height/2) radius:self.width*self.size startAngle:PQ_RADIANS(-60) endAngle:PQ_RADIANS(-120) clockwise:NO].CGPath;
    [self.layer addSublayer:self.circleLayer];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
