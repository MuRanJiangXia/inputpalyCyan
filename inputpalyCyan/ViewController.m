//
//  ViewController.m
//  inputpalyCyan
//
//  Created by cyan on 2018/8/13.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import "ViewController.h"
#import "CYTextField.h"

@interface ViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UIView *inputBgView;
@property(nonatomic,strong)CYTextField *cyTextField;


@property(nonatomic,strong)NSMutableArray<UILabel *> *labArr;
@property(nonatomic,strong)NSMutableArray *strArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _strArr = [NSMutableArray array];
    _inputBgView = [[UIView alloc]initWithFrame:CGRectMake(40, 60, 145, 30)];
//    _inputBgView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_inputBgView];
    
    _labArr = [NSMutableArray new];
    for (NSInteger index = 0; index < 6; index ++) {
        UILabel *label  = [[UILabel alloc]initWithFrame:CGRectMake( (5 + 20) * index, 0, 20, 20)];
        label.backgroundColor = [UIColor redColor];
        label.textColor = [UIColor yellowColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.inputBgView addSubview:label];
        [_labArr addObject:label];
    }
    

    _cyTextField  = [[CYTextField alloc]initWithFrame:_inputBgView.bounds];
    _cyTextField.isClosePaste = YES;
    // UITextField关闭系统自动联想和首字母大写功能
    [_cyTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_cyTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    _cyTextField.keyboardType = UIKeyboardTypeNumberPad;
    _cyTextField.clearButtonMode = UITextFieldViewModeNever;
    _cyTextField.font = [UIFont systemFontOfSize:14];
    _cyTextField.delegate = self;
    _cyTextField.tintColor = [UIColor clearColor];
    _cyTextField.backgroundColor = [UIColor clearColor];
    _cyTextField.placeholder = @"";
    _cyTextField.textColor = [UIColor clearColor];
    [_cyTextField addTarget:self action:@selector(valeChange:) forControlEvents:UIControlEventEditingChanged];
    [self.inputBgView addSubview:_cyTextField];
    

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_cyTextField resignFirstResponder];
}
-(void)valeChange:(UITextField *)textF{
    NSLog(@"text : %@",textF.text);

}

#pragma mark - UITextFieldDelegate
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@""]) {
        [_strArr removeLastObject];
        [self reloadTextLab];
        return YES;
    }
    if (textField.text.length == 6) {
        [self reloadTextLab];
        return NO;
    }
    
    [_strArr addObject:string];
    [self reloadTextLab];
    return YES;
    
}

-(void)reloadTextLab{
    __weak typeof(self)weakSelf = self;
    [self.labArr enumerateObjectsUsingBlock:^(UILabel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx < self.strArr.count) {
            obj.text =  weakSelf.strArr[idx];
        }else{
            obj.text = @"";
        }
    }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
