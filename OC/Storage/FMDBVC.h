//
//  FMDBVC.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

@interface FMDBVC : BaseViewController

@end

#pragma mark - 建表
/*
     if (![_shonemeDBManager.db tableExists:@"TalentListTopPic"])
     {
        [_shonemeDBManager.db executeUpdate:@"CREATE TABLE TalentListTopPic (only text ,picURL text)"];
     }
 */

#pragma mark - 插入数据
/*
    1:
     [_shonemeDBManager.db executeUpdate:@"INSERT INTO TalentList (userid,nickname,photo,is_myself,is_follow) VALUES (?,?,?,?,?)",model.user_id,model.nickname,model.photo,model.is_myself,model.is_follow];
 
    2:
    [self.db executeUpdateWithFormat:@"INSERT INTO t_student (name, age) VALUES ('jack_%d', %d);", name, arc4random_uniform(40)];
 
 */


#pragma mark - 查询数据
/*

    1： 条件查询  //返回数据库中第一条满足条件的结果
 
         NSString *aa=[db stringForQuery:@"SELECT Name FROM User WHERE Age = ?",@"10"];
 
    2： 条件查询 //返回全部查询结果
 
         FMResultSet *rs=[db executeQuery:@"SELECT * FROM User"];
         
         rs=[db executeQuery:@"SELECT * FROM User WHERE Age = ?",@"10"];
         
         while ([rs next]){
         NSLog(@"%@ %@",[rs stringForColumn:@"Name"],[rs stringForColumn:@"Age"]);
         }
         
         [rs close];
 
    3: 返回整个表的数组
 
         FMResultSet *rst = [_shonemeDBManager.db executeQuery:@"SELECT * FROM DiscoverTopicList"];
         while ([rst next])
         {
         TipsTopicModel *model = [[TipsTopicModel alloc] init];
         model.topic_id = [rst stringForColumn:@"topic_id"];
         model.topic_title = [rst stringForColumn:@"topic_title"];
         model.topic_pic_url = [rst stringForColumn:@"topic_pic_url"];
         
         [topicArray addObject:model];
 
*/

#pragma mark - 根据条件查询修改某个对象属性
/*
    [_shonemeDBManager.db executeUpdate:@"UPDATE TalentList SET is_follow = ? WHERE userid = ?",model.is_follow,model.user_id];
 
 
 
 */


#pragma mark - 删除
/*
    1: 删除整个表的数据
      [_shonemeDBManager.db executeUpdate:@"DELETE FROM TalentList"];
 
    2：根据查询结构删除
        [_shonemeDBManager.db executeUpdate:@"delete from DiscoverGoodsClassifyList where type = ?",type];

 */






