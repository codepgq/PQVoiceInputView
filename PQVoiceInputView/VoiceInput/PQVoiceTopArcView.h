//
//  PGQVoiceTopArcView.h
//  pgqVoiceInput
//
//  Created by ios on 16/7/15.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQVoiceTopArcView : UIView

@property (nonatomic,strong) CAShapeLayer * circleLayer;

- (instancetype)initWithFrame:(CGRect)frame lineWidth:(CGFloat)lineWidth lindeColor:(UIColor *)lineColor size:(CGFloat)size;

@end
