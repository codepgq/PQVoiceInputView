//
//  PGQTopAnimationView.m
//  pgqVoiceInput
//
//  Created by ios on 16/7/15.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQTopArcAnimationView.h"
#import "PQVoiceInput.h"
@interface PQTopArcAnimationView ()

@property (nonatomic,assign) CGFloat lineWidth;
@property (nonatomic,strong) UIColor * lineColor;
@property (nonatomic,strong) NSTimer * timer;
@property (nonatomic,assign) NSTimeInterval time;

@property (nonatomic,strong) NSMutableArray * views;

@end

@implementation PQTopArcAnimationView

- (NSMutableArray *)views{
    if (!_views) {
        _views = [NSMutableArray array];
    }
    return _views;
}

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
//    int startAngle,endAngle;
    double  a[] = {0.1,0.2,0.3,0.4,0.5};
    for (int i = 0; i < 5; i++) {
        [self addLayer:a[i]];
    }
}

- (void)startAnimation:(NSInteger)count{
    for (int i = 0; i < 5 ; i++) {
        PQVoiceTopArcView * view = self.views[i];
        if (i<count) {
            [view setHidden:NO];
        }else
            [view setHidden:YES];
        
    }
}
- (void)stopAnimation{
    for (PQVoiceTopArcView * view in self.views) {
        [view setHidden:YES];
    }
}

- (void)addLayer:(CGFloat)size{
    
    PQVoiceTopArcView *circleView1 = [[PQVoiceTopArcView alloc]initWithFrame:self.bounds lineWidth:self.lineWidth*2 lindeColor:[UIColor grayColor] size:size];
    circleView1.hidden = NO;
    [self addSubview:circleView1];
    
    PQVoiceTopArcView *circleView = [[PQVoiceTopArcView alloc]initWithFrame:self.bounds lineWidth:self.lineWidth*2 lindeColor:self.lineColor size:size];
    circleView.hidden = YES;
    [self addSubview:circleView];
    [self.views addObject:circleView];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
