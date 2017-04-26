//
//  PayAlertView.m
//  PayResultAlertView
//
//  Created by kuanter on 16/4/15.
//  Copyright © 2016年 kuanter. All rights reserved.
//

#import "PayAlertView.h"



@interface PayAlertView ()
@property(nonatomic,strong)UIView*contentView;
@property (nonatomic,copy) void (^dialogViewCompleteHandle)(NSInteger);//block回调方法

@end

@implementation PayAlertView


-(id)initWithNSDictionary:(NSDictionary*)dic{
    self=[super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {

        [self setup];
       
    }
    return self;
}
-(void)setup{
    
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5f];
    
    //显示框
    _contentView=[[UIView alloc] initWithFrame:CGRectMake(10, 90, self.bounds.size.width-20, 300)];
    _contentView.backgroundColor=[UIColor whiteColor];
    _contentView.layer.cornerRadius=5.0;
    [self addSubview:_contentView];
    
    //右上button
    UIButton*rightTopButton=[UIButton buttonWithType:UIButtonTypeSystem];
    rightTopButton.frame=CGRectMake(10, 100, 100, 30);
    [rightTopButton setImage:[[UIImage imageNamed:@"hhb_order_pay"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [rightTopButton addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
    rightTopButton.backgroundColor=[UIColor greenColor];
    
    [rightTopButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [rightTopButton setTitle:@"取消" forState:UIControlStateNormal];
    [_contentView addSubview:rightTopButton];
    
    //查看订单详情button
    UIButton*xiangQingButton=[UIButton buttonWithType:UIButtonTypeSystem];
    xiangQingButton.frame=CGRectMake(self.bounds.size.width-130, 100, 100, 30);
    [xiangQingButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    xiangQingButton.tag=100;
    xiangQingButton.backgroundColor=[UIColor yellowColor];
    [xiangQingButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [xiangQingButton setTitle:@"确定" forState:UIControlStateNormal];
    [_contentView addSubview:xiangQingButton];
    
    
    
    
    
    
    
   
    
 
    
    
    
    
}
////button点击事件
-(void)buttonAction:(UIButton*)button{
    
     NSInteger selIndex = button.tag;
    [self closeView];
    
    if(_dialogViewCompleteHandle)
    {
        _dialogViewCompleteHandle(selIndex);//通过block回调方法来执行外部方法
    }
    
}

-(void)showWithCompletion:(void (^)(NSInteger selectIndex))completeBlock{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [self showInView:keyWindow completion:completeBlock];
}

//显示
-(void)showInView:(UIView *)baseView completion:(void (^)(NSInteger))completeBlock{
    
  
    
   self.dialogViewCompleteHandle = completeBlock;
    
    [baseView addSubview:self];
    //放缩对话
    _contentView.alpha = 0;
    _contentView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    
    [UIView animateWithDuration:0.3f animations:^{
        _contentView.alpha = 1.0;
        _contentView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    }];
}
//关闭
-(void)closeView{
    [UIView animateWithDuration:0.3f animations:^{
        _contentView.alpha = 0;
        _contentView.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    

}


@end
