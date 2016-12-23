//
//  UserModel.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/23.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "OCBaseModel.h"

@interface UserModel : OCBaseModel

//__nullable表示对象可以是NULL或nil，而__nonnull表示对象不应该为空

@property (nonatomic,copy,nullable) NSString *userID;
@property (nonatomic,copy,nullable) NSString *userName;

@end
