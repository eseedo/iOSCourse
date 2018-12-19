//
//  Checklist.m
//  Checklists
//
//  Created by Matthijs on 12-24-13.
//  Copyright (c) 2013 Happy Bubsy. All rights reserved.
//

#import "Checklist.h"

@implementation Checklist

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
