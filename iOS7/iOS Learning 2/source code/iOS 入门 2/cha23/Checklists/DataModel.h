//
//  DataModel.h
//  Checklists
//
//  Created by happybubsy on 12/24/13.
//  Copyright (c) 2013 Happy Bubsy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property(nonatomic,strong)NSMutableArray *lists;

-(void)saveChecklists;

-(NSInteger)indexOfSelectedChecklist;

-(void)setIndexOfSelectedChecklist:(NSInteger)index;

-(void)sortChecklists;


@end
