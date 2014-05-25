//
//  Location.h
//  MyLocations
//
//  Created by Wang Han on 4/11/14.
//  Copyright (c) 2014 happybubsy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSString * locationDescription;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) CLPlacemark *placemark;

@end
