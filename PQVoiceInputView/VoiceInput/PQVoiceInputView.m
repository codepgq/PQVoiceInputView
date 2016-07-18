//
//  PGQVoiceInputView.m
//  pgqVoiceInput
//
//  Created by ios on 16/7/14.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQVoiceInputView.h"
#import "PQVoiceInput.h"
@interface PQVoiceInputView ()
/**
 *  标题栏
 */
@property (nonatomic,strong) UILabel * titleLabel;
/**
 *  语音图标
 */
@property (nonatomic,strong) PQVoiceView * voiceView;
/**
 *  圆环
 */
@property (nonatomic,strong) PQVoiceCircleView * circleView;
/**
 *  往外扩张动画view
 */
@property (nonatomic,strong) PQCircleAnimationView *animationView;
/**
 *  圆弧向上显示view
 */
@property (nonatomic,strong) PQTopArcAnimationView *topARCAnima;
/**
 *  显示方式
 */
@property (nonatomic,assign) VOICEINPUTTYPE showType;
/**
 *  话筒宽
 */
@property (nonatomic,assign) CGFloat voiceSizeW;
/**
 *  话筒高
 */
@property (nonatomic,assign) CGFloat voiceSizeH;
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
/**
 *  是不是实心话筒
 */
@property (nonatomic,assign) BOOL isColid;
/**
 *  save block
 */
@property (nonatomic,copy) PGQVoiceInputHiddenBlock hiddenBlock;
@property (nonatomic,strong) UISwipeGestureRecognizer * keepSwipe;
@property (nonatomic,strong) id VC;
@end

@implementation PQVoiceInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    CGRect newFrame = frame;
    CGFloat min = (newFrame.size.width >= newFrame.size.height )?newFrame.size.width:newFrame.size.height;
    newFrame.size.width = min;
    newFrame.size.height = min;
    self = [super initWithFrame:newFrame];
    if (self) {
        //处理一些默认参数
        self.isColid = NO;
        self.lineColor = [UIColor whiteColor];
        self.colidColor = self.lineColor;
        
        [self initLineWidth];
        
    }
    return self;
}

- (void)initLineWidth{
    if (self.width <= 50) {
        self.lineWidth = 1.5;
    }else if (self.width <= 100){
        self.lineWidth = 2;
    }else if (self.width <= 200){
        self.lineWidth = 4;
    }else if (self.width <= 300){
        self.lineWidth = 4.5;
    }else{
        self.lineWidth = 6;
    }
    
}

+ (__kindof PQVoiceInputView * _Nonnull)pgq_reateVoiceViewWithRect:(CGRect)frame voiceColor:(UIColor* _Nullable)lineColor volumeColor:(UIColor* _Nullable)colidColor title:(NSString * _Nullable)title showType:(VOICEINPUTTYPE)type hidden:(PGQVoiceInputHiddenBlock _Nullable)block{
    
    PQVoiceInputView * viv = [[PQVoiceInputView alloc]initWithFrame:frame];
    //添加手势
    [viv initGestureRecognizer:block];
    /**
     初始化颜色
     */
    [viv initColorWithLineColor:lineColor colidColor:colidColor];
    /**
     初始化标题
     */
    [viv initTitle:title];
    /**
     设置为圆角矩形 并且向下透明
     */
    if (type == 0) {
        [viv radiusRect:0.1];
    }else if (type == 1 || type == 2){
        [viv radiusRect:0.5];
    }
    //记住type
    viv.showType = type;
    /**
     生成View
     */
    [viv calculateVoiceBodyTopSize:type LineColor:viv.lineColor colidColor:viv.colidColor];
    return viv;
}

- (void)initGestureRecognizer:(PGQVoiceInputHiddenBlock)block{
    //保存 block
    self.hiddenBlock = block;
//    //添加手势
    self.userInteractionEnabled = YES;
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeToTopEvent:)];
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipe];
    

}

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;  
}

//- (void)tapToHintEvent:(UITapGestureRecognizer *)tap{
//    if (tap.state == UIGestureRecognizerStateBegan) {
//        //显示一个提示框
//        NSLog(@"按下");
//    }else if (tap.state == UIGestureRecognizerStateEnded){
//        NSLog(@"松开");
//    }
//}

 - (void)swipeToTopEvent:(UISwipeGestureRecognizer *)swipe{
    self.hiddenBlock((PQVoiceInputView *)swipe.view,@"移除",2);
}

- (void)radiusRect:(CGFloat)radius{
    self.layer.cornerRadius = self.width * radius;
    self.backgroundColor = PQ_COLOR(0, 0, 0, 0.4);
}

- (void)initTitle:(NSString *)title{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(self.width*0.24 , self.height*0.08, self.width*0.52, 10)];
    label.adjustsFontSizeToFitWidth = YES;
    label.text = title;
    label.textColor = self.lineColor;
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    self.titleLabel = label;
    [self addSubview:self.titleLabel];
}

//计算文字大小
- (CGSize)resultWithLabel:(UILabel *)label{
    NSDictionary *attrs = @{NSFontAttributeName : label.font};
    return [label.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (void)initColorWithLineColor:(UIColor *)lineColor colidColor:(UIColor*)colidColor{
    if (lineColor) {
        self.lineColor = lineColor;
    }
    if (colidColor) {
        self.colidColor = colidColor;
    }
}

- (void)createVoiceBodyViewWithLineColor:(UIColor *)lineColor colidColor:(UIColor *)colidColor{
    self.voiceView = [PQVoiceView pgq_reateVoiceTopViewWithRect:CGRectMake(self.width * ((1-self.voiceSizeW)/2), self.height - (self.height * self.voiceSizeH) , self.width * self.voiceSizeW, self.height * self.voiceSizeH) voiceColor:lineColor volumeColor:colidColor isColid:self.isColid lineWidth:self.lineWidth];
    [self addSubview:self.voiceView];
}

- (void)calculateVoiceBodyTopSize:(VOICEINPUTTYPE)showType LineColor:(UIColor *)lineColor colidColor:(UIColor *)colidColor{
    if (showType == 0) {
        self.voiceSizeW = 0.6;
        self.voiceSizeH = 0.6;
        self.isColid = YES;
        [self createVoiceBodyViewWithLineColor:lineColor colidColor:colidColor];
    }else if (showType == 1){
        self.voiceSizeW = 0.3;
        self.voiceSizeH = 0.3;
        self.lineWidth = 1;
        [self createVoiceBodyViewWithLineColor:lineColor colidColor:colidColor];
        self.titleLabel.y = self.titleLabel.y + self.titleLabel.height; 
        self.voiceView.center= CGPointMake(self.width/2, self.height/2 + self.titleLabel.height);
        //add circle
        [self addCircleView];
        [self addAnimationCircle];
    }else if (showType == 2){
        self.voiceSizeW = 0.3;
        self.voiceSizeH = 0.3;
        self.lineWidth = 1;
        [self createVoiceBodyViewWithLineColor:lineColor colidColor:colidColor];
        self.titleLabel.hidden = YES;
        
        [self addAnimationARCTop];
        self.voiceView.y = self.topARCAnima.y + self.voiceView.height;
    }
}

- (void)addAnimationARCTop{
    self.topARCAnima = [[PQTopArcAnimationView alloc] initWithFrame:CGRectMake(self.width*0.1, self.height*0.25, self.width*0.8, self.height*0.5) lineWidth:self.lineWidth lindeColor:self.colidColor];
    [self addSubview:self.topARCAnima];
}

- (void)addAnimationCircle{
    self.animationView = [[PQCircleAnimationView alloc]initWithFrame:self.bounds lineWidth:self.lineWidth lindeColor:self.colidColor];
    [self addSubview:self.animationView];
}

- (void)addCircleView{
    //size 0.1 - 0.5
    self.circleView = [[PQVoiceCircleView alloc]initWithFrame:CGRectMake(self.width*0.05, self.height*0.05, self.width*0.9, self.height*0.9) lineWidth:self.lineWidth lindeColor:self.lineColor size:0.5];
    
    [self addSubview:self.circleView];
    
}

- (void)updateVoiceViewWithVolume:(float)volume{
    if (self.showType != VOICEINPUT_TYPE_INSIDE) {
        return;
    }
    [self.voiceView updateVoiceViewWithVolume:volume];
}

- (void)updateTitle:(NSString *)title{
    self.titleLabel.text = title;
}

- (void)updateTitleColor:(UIColor * _Nullable)color{
    if (color) {
        self.titleLabel.textColor = color;
    }
}

- (void)updateTitle:(NSString * _Nullable)title textColor:(UIColor * _Nullable)color{
    if (title) {
        self.titleLabel.text = title;
    }
    if (color) {
        self.titleLabel.textColor = color;
    }
}

- (void)startCircleAnimation{
    if (self.showType != VOICEINPUT_TYPE_OUTSIDE) {
        return;
    }
    [self.animationView startAnimation];
}
- (void)stopCircleAnimation{
    if (self.showType != VOICEINPUT_TYPE_OUTSIDE) {
        return;
    }
    [self.animationView stopAnimation];
}

- (void)startTopArcAnimationWithVolume:(CGFloat)volume{
    if (self.showType != VOICEINPUT_TYPE_TOP) {
        return;
    }
    
    NSInteger count = 0;
    switch ((int)(volume*10)) {
        case 1:
        case 2:
            count = 1;
            break;
        case 3:
        case 4:
            count = 2;
            break;
        case 5:
        case 6:
            count = 3;
            break;
        case 7:
        case 8:
            count = 4;
            break;
        case 9:
        case 10:
            count = 5;
            break;
        default:
            break;
    }
    
    [self.topARCAnima startAnimation:count];
}

- (void)stopopArcAnimation{
    if (self.showType != VOICEINPUT_TYPE_TOP) {
        return;
    }
    [self.topARCAnima stopAnimation];
}


@end
