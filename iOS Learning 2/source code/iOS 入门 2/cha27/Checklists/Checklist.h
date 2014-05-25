//
//  Checklist.h
//  Checklists
//
//  Created by Matthijs on 12-24-13.
//  Copyright (c) 2013 Happy Bubsy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property(nonatomic,strong) NSMutableArray *items;

@property(nonatomic,copy)NSString *iconName;


-(int)countUncheckedItems;

@end
