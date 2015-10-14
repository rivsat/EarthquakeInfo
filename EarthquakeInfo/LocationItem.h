//
//  locationItem.h
//  EarthquakeInfo
//
//  Created by Tasvir H Rohila on 14/10/2015.
//  Copyright © 2015 Tasvir H Rohila. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationItem.h"

@interface locationItem : NSObject

@property (nonatomic, weak) NSString* timeDate;
@property (nonatomic, weak) NSString* lat;
@property (nonatomic, weak) NSString* lon;
@property (nonatomic, weak) NSString* magnitude;
@property (nonatomic, weak) NSString* depth;
@property (nonatomic, weak) NSString* region;

@end
