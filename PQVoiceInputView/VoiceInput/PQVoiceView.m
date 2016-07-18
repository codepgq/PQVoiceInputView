//
//  pgqVoiceTopView.m
//  pgqVoiceInput
//
//  Created by ios on 16/7/14.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQVoiceView.h"
#import "PQVoiceInput.h"

@interface PQVoiceView ()

/**
 *  话筒顶部
 */
@property (nonatomic,strong) PQVoiceTopView * topView;
/**
 *  话筒底部
 */
@property (nonatomic,strong) PQVoiceBottomView * bomView;
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

@implementation PQVoiceView

+ (__kindof PQVoiceView * _Nonnull)pgq_reateVoiceTopViewWithRect:(CGRect)frame voiceColor:(UIColor* _Nullable)fColor volumeColor:(UIColor* _Nullable)vColor isColid:(BOOL)isColid lineWidth:(CGFloat)lineWidth{
    PQVoiceView * vtv = [[PQVoiceView alloc]initWithFrame:frame];
    
    //初始化参数
    [vtv initColorAndLineWidthWithvoiceColor:fColor volumeColor:vColor isColid:isColid lineWidth:lineWidth];
    // 创建上半部分的话筒
    [vtv createTopView];
    // 创建下半部分的话筒
    [vtv createBottmView];
    
//    vtv.backgroundColor = [UIColor redColor];
    
    return vtv;
}

- (void)initColorAndLineWidthWithvoiceColor:(UIColor* _Nullable)fColor volumeColor:(UIColor* _Nullable)vColor isColid:(BOOL)isColid lineWidth:(CGFloat)lineWidth{
    //设置线宽
    self.lineWidth = lineWidth;
    //设置颜色
    self.lineColor = fColor;
    self.colidColor = vColor;
}

- (void)createTopView{
    self.topView = [[PQVoiceTopView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height*0.7) lineWidth:self.lineWidth linceColor:self.lineColor colidColor:self.colidColor];
    [self addSubview:self.topView];
    
    self.bomView = [[PQVoiceBottomView alloc]initWithFrame:CGRectMake(0, self.height*0.7, self.width, self.height*0.3) lineWidth:self.lineWidth lindeColor:self.lineColor ];
    [self addSubview:self.bomView];
}

- (void)createBottmView{
    
}

- (void)updateVoiceViewWithVolume:(float)volume{
    [self.topView updateVoiceViewWithVolume:volume];
}

@end
