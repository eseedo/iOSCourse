//
//  HudView.h
//  MyLocations
//
//  Created by Wang Han on 3/14/14.
//  Copyright (c) 2014 happybubsy. All rights reserved.
//


@interface HudView : UIView


+(instancetype)hudInView:(UIView*) view
                animated:(BOOL)animated;

@property(nonatomic,strong) NSString *text;

@end
