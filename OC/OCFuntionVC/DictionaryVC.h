//
//  DictionaryVC.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/22.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

@interface DictionaryVC : BaseViewController
{
    int radius;
    int x;
    int y;
}

- (int)getX;
- (void)setX:(int)_x;


@end
