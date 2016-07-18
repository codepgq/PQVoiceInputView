//
//  PGQVoiceInputView.h
//  pgqVoiceInput
//
//  Created by ios on 16/7/14.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    VOICEINPUT_TYPE_INSIDE,//话筒实心
    VOICEINPUT_TYPE_OUTSIDE,//向外扩张圆
    VOICEINPUT_TYPE_TOP,//向上显示圆弧
}VOICEINPUTTYPE;



@interface PQVoiceInputView : UIView

typedef void(^PGQVoiceInputHiddenBlock)(PQVoiceInputView * _Nullable view,NSString * _Nullable text,NSInteger type);
/**
 *  根据type 返回一个话筒样式 
 *
 *  @param frame      大小
 *  @param lineColor  线颜色
 *  @param colidColor 动画填充颜色
 *  @param title      标题
 *  @param block      上划取消
 *
 *  @return PGQVoiceInputView
 */
+ (__kindof PQVoiceInputView * _Nonnull)pgq_reateVoiceViewWithRect:(CGRect)frame voiceColor:(UIColor* _Nullable)lineColor volumeColor:(UIColor* _Nullable)colidColor title:(NSString * _Nullable)title showType:(VOICEINPUTTYPE)type hidden:(PGQVoiceInputHiddenBlock _Nullable)block;
/**
 *  更新UI 根据音量大小 0.0 - 1.0
 *
 *  @param volume 音量
 */
- (void)updateVoiceViewWithVolume:(float)volume;
/**
 *  刷新标题
 *
 *  @param title 标题
 */
- (void)updateTitle:(NSString * _Nullable)title;
/**
 *  更新文字颜色
 *
 *  @param color color
 */
- (void)updateTitleColor:(UIColor * _Nullable)color;
/**
 *  更新标题颜色 和 文字
 *
 *  @param title <#title description#>
 *  @param color <#color description#>
 */
- (void)updateTitle:(NSString * _Nullable)title textColor:(UIColor * _Nullable)color;
/**
 *  开始圆形向外扩张动画
 */
- (void)startCircleAnimation;
/**
 *  结束圆形向外扩张动画
 */
- (void)stopCircleAnimation;
/**
 *  开始圆弧形向上扩张动画根据volume
 */
- (void)startTopArcAnimationWithVolume:(CGFloat)volume;
/**
 *  开始圆弧形向上扩张动画
 */
- (void)stopopArcAnimation;

//- (void)swipeToTopEvent:(UISwipeGestureRecognizer * _Nullable)swipe;
@end
