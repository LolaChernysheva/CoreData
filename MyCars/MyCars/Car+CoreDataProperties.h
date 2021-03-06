//
//  Car+CoreDataProperties.h
//  MyCars
//
//  Created by Лолита on 05.03.2021.
//  Copyright © 2021 Ivan Akulov. All rights reserved.
//
//

#import "Car+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Car (CoreDataProperties)

+ (NSFetchRequest<Car *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *mark;
@property (nullable, nonatomic, copy) NSString *model;
@property (nullable, nonatomic, copy) NSNumber *rating;
@property (nullable, nonatomic, copy) NSNumber *timesDriven;
@property (nullable, nonatomic, copy) NSDate *lastStarted;
@property (nullable, nonatomic, copy) NSNumber *myChoice;
@property (nullable, nonatomic, retain) NSData *imageData;
@property (nullable, nonatomic, retain) NSObject *tintColor;

@end

NS_ASSUME_NONNULL_END
