//
//  EarthquakeLocation.h
//  EarthquakeInfo
//
//  Created by Tasvir H Rohila on 14/10/2015.
//  Copyright  © 2015 Tasvir H Rohila. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface EarthquakeLocation : NSObject <MKAnnotation>


- (id)initWithName:(NSString*)location withDateTime:(NSString*)dateTime withCoordinate:(CLLocationCoordinate2D)coordinate;
- (MKMapItem*)mapItem;

@end
