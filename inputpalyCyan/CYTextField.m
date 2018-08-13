//
//  CYTextField.m
//  inputpalyCyan
//
//  Created by cyan on 2018/8/13.
//  Copyright © 2018年 cyan. All rights reserved.
//

#import "CYTextField.h"

@implementation CYTextField

/**禁止复制粘贴*/
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    
    if (self.isClosePaste) {
        // 禁用粘贴功能
        if (action == @selector(paste:))
            return NO;
        
        // 禁用选择功能
        if (action == @selector(select:))
            return NO;
        
        // 禁用全选功能
        if (action == @selector(selectAll:))
            return NO;
        
    }
    
    return [super canPerformAction:action withSender:sender];
}



@end
