//
//  Episode.h
//  iOSLibs
//
//  Created by jeremy Templier on 17/03/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import <RestKit/RestKit.h>

@interface Episode : NSObject 

@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* body;
@property (nonatomic, retain) NSString* published_at;
@property (nonatomic, retain) NSDate*   video_url;


+ (RKObjectMapping*) initMapping;

@end
