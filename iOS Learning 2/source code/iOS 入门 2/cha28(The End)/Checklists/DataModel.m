//
//  DataModel.m
//  Checklists
//
//  Created by happybubsy on 12/24/13.
//  Copyright (c) 2013 Happy Bubsy. All rights reserved.
//

#import "DataModel.h"

#import "Checklist.h"

@implementation DataModel

+(NSInteger)nextChecklistItemId{
    
    NSUserDefaults *userDefaults =[NSUserDefaults standardUserDefaults];
    
    NSInteger itemId = [userDefaults integerForKey:@"ChecklistItemId"];
    
    [userDefaults setInteger:itemId +1 forKey:@"ChecklistItemId"];
    [userDefaults synchronize];
    return itemId;

}

-(void)sortChecklists{
    
    [self.lists sortUsingSelector:@selector(compare:)];
    
}

-(void)registerDefaults{
    
    NSDictionary *dictionary = @{@"ChecklistIndex" :@-1,@"FirstTime":@YES,@"ChecklistItemId":@0};
    
    [[NSUserDefaults standardUserDefaults]registerDefaults:dictionary];
}

-(void)handleFirstTime{
    
    BOOL firstTime = [[NSUserDefaults standardUserDefaults]boolForKey:@"FirstTime"];
    
    if(firstTime){
        
        Checklist *checklist = [[Checklist alloc]init];
        
        checklist.name = @"List";
        
        [self.lists addObject:checklist];
        
        [self setIndexOfSelectedChecklist:0];
        
        [[NSUserDefaults standardUserDefaults]setBool:NO forKey:@"FirstTime"];
        
        
    }
}


#pragma mark init初始化

-(id)init{
    
    if((self =[super init])){
        
        [self loadChecklists];
        [self registerDefaults];
        [self handleFirstTime];
    }
    return self;
}

#pragma mark 获取沙盒地址

-(NSString*)documentsDirectory{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    
    return documentsDirectory;
}

-(NSString*)dataFilePath{
    
    return [[self documentsDirectory]stringByAppendingPathComponent:@"Checklists.plist"];
}

-(void)saveChecklists{
    
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    [archiver encodeObject:_lists forKey:@"Checklists"];
    [archiver finishEncoding];
    
    [data writeToFile:[self dataFilePath] atomically:YES];
    
    
}

-(void)loadChecklists{
    
    NSString *path = [self dataFilePath];
    
    if([[NSFileManager defaultManager]fileExistsAtPath:path]){
        
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        
        self.lists = [unarchiver decodeObjectForKey:@"Checklists"];
        
        [unarchiver finishDecoding];
    }else{
        
        self.lists = [[NSMutableArray alloc]initWithCapacity:20];
    }
    
}


#pragma mark NSUserDefaults

-(NSInteger)indexOfSelectedChecklist{
    
    return [[NSUserDefaults standardUserDefaults]integerForKey:@"ChecklistIndex"];
}

-(void)setIndexOfSelectedChecklist:(NSInteger)index{
    
    [[NSUserDefaults standardUserDefaults]setInteger:index forKey:@"ChecklistIndex"];
    
}

@end
