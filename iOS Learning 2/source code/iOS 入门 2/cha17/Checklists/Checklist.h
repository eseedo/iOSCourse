//
//  Checklist.h
//  Checklists
//
//  Created by Matthijs on 02-10-13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject<NSCoding>

@property (nonatomic, copy) NSString *name;
@property(nonatomic,strong) NSMutableArray *items;

@end
