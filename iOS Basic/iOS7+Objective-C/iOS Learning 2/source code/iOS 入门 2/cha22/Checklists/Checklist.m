//
//  Checklist.m
//  Checklists
//
//  Created by Matthijs on 12-24-13.
//  Copyright (c) 2013 Happy Bubsy. All rights reserved.
//

#import "Checklist.h"
#import "ChecklistItem.h"

@implementation Checklist


//count

-(int)countUncheckedItems{
    
    int count = 0;
    for(ChecklistItem *item in self.items){
        if(!item.checked){
            count+=1;
        }
    }
    return count;
    
}

-(id)init{
    
    if((self = [super init])){
        self.items = [[NSMutableArray alloc]initWithCapacity:20];
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    if((self =[super init])){
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        self.items = [aDecoder decodeObjectForKey:@"Items"];
        
    }
    return self;
    
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    
    
    [aCoder encodeObject:self.name forKey:@"Name"];
    
    [aCoder encodeObject:self.items forKey:@"Items"];
}

@end
