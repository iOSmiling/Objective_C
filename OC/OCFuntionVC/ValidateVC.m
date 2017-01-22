//
//  ValidateVC.m
//  OC
//
//  Created by 薛坤龙 on 2017/1/18.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "ValidateVC.h"

@interface ValidateVC ()<UITextViewDelegate>

@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UILabel *tipLabel;
@property (nonatomic,strong) UIButton *btn;

@end

@implementation ValidateVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIControl *control = [[UIControl alloc] initWithFrame:self.view.frame];
    [control addTarget:self action:@selector(disMiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:control];
    
    [self.view addSubview:self.textView];
    [self.view addSubview:self.tipLabel];
    [self.view addSubview:self.btn];
    
    _textView.frame = CGRectMake((self.view.frame.size.width - 200)/2, 100, 200, 46);
    _tipLabel.frame = CGRectMake((self.view.frame.size.width - 300)/2, CGRectGetMaxY(_textView.frame)+20, 300, 46);
    _btn.frame = CGRectMake((self.view.frame.size.width - 100)/2, 400, 100, 46);
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_textView resignFirstResponder];
    

}

- (void)validate
{
    NSString *textString = _textView.text;
    NSLog(@"输入字符:%@",textString);
    
    NSString *tipString = @"";
    
    if ([self validateNumber:textString])
    {
        tipString = @"纯数字";
       
    }else
    {
        tipString = @"非纯数字";
    }
    
     _tipLabel.text = [NSString stringWithFormat:@"验证结果:%@",tipString];

}

/**
 验证纯数字

 @param textString 目标字符串
 @return 验证结果
 */
- (BOOL)validateNumber:(NSString *) textString
{
    NSString* number=@"^[0-9]+$";
    NSPredicate *numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",number];
    return [numberPre evaluateWithObject:textString];
}


- (void)disMiss
{
//    self.editing = YES;
    
    [_textView resignFirstResponder];

}

- (UITextView *)textView
{
    if (!_textView)
    {
        _textView = [[UITextView alloc] init];
        _textView.delegate = self;
        _textView.layer.borderColor = [UIColor blueColor].CGColor;
        _textView.layer.borderWidth = 1;
    }
    return _textView;
}

- (UILabel *)tipLabel
{
    if (!_tipLabel)
    {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _tipLabel;
}

- (UIButton *)btn
{
    if (!_btn)
    {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn setTitle:@"验证" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(validate) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}


@end
