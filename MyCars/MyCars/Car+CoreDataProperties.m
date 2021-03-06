//
//  Car+CoreDataProperties.m
//  MyCars
//
//  Created by Лолита on 05.03.2021.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//
//

#import "Car+CoreDataProperties.h"

@implementation Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Car"];
}

@dynamic mark;
@dynamic model;
@dynamic rating;
@dynamic timesDriven;
@dynamic lastStarted;
@dynamic myChoice;
@dynamic imageData;
@dynamic tintColor;

@end
