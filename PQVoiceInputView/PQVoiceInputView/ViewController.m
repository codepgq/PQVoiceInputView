//
//  ViewController.m
//  PQVoiceInputView
//
//  Created by ios on 16/7/18.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "ViewController.h"

#import "PQVoiceInput.h"

@interface ViewController ()

@property (nonatomic,strong) PQVoiceInputView *voiceView;
@property (nonatomic,strong) PQVoiceInputView *voiceView1;
@property (nonatomic,strong) PQVoiceInputView *voiceView2;
@property (weak, nonatomic) IBOutlet UISlider *sliderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
    self.voiceView = [PQVoiceInputView pgq_reateVoiceViewWithRect:CGRectMake(100, 20, 100, 100) voiceColor:nil volumeColor:nil title:@"还没声音" showType:0 hidden:^(PQVoiceInputView * _Nullable view, NSString * _Nullable text, NSInteger type) {
        NSLog(@"上滑");
    }];
    [self.view addSubview:self.voiceView];
    
    
    
    self.voiceView1 = [PQVoiceInputView pgq_reateVoiceViewWithRect:CGRectMake(100, 130, 50, 100) voiceColor:[UIColor cyanColor] volumeColor:[UIColor redColor] title:@"按下说话" showType:1 hidden:^(PQVoiceInputView * _Nullable view, NSString * _Nullable text, NSInteger type) {
        NSLog(@"上滑");
    }];
    [self.view addSubview:self.voiceView1];
    //
    self.voiceView2 = [PQVoiceInputView pgq_reateVoiceViewWithRect:CGRectMake(100, 250, 100, 100) voiceColor:[UIColor cyanColor] volumeColor:[UIColor greenColor] title:@"正在聆听..." showType:2 hidden:^(PQVoiceInputView * _Nullable view, NSString * _Nullable text, NSInteger type) {
        NSLog(@"上滑");
    }];
    [self.view addSubview:self.voiceView2];
    
    [self.sliderView addTarget:self action:@selector(updateVolume:) forControlEvents:UIControlEventValueChanged];
    
}

- (void)updateVolume:(UISlider *)slider{
    
    [self.voiceView updateVoiceViewWithVolume:slider.value];
    [self.voiceView updateTitle:@"正在聆听..." textColor:[UIColor greenColor]];
    
    
    
    [self.voiceView2 startTopArcAnimationWithVolume:slider.value];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static int i = 0;
    if (i == 0) {
        [self.voiceView1 startCircleAnimation];
        i = 1;
        [self.voiceView1 updateTitle:@"正在聆听" textColor:[UIColor greenColor]];
    }else{
        [self.voiceView1 stopCircleAnimation];
        [self.voiceView1 updateTitle:@"按下说话" textColor:[UIColor orangeColor]];
        i = 0;
    }
}

@end
