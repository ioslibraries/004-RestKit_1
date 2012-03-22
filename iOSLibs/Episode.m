//
//  Episode.m
//  iOSLibs
//
//  Created by jeremy Templier on 17/03/12.
//  Copyright (c) 2012 particulier. All rights reserved.
//

#import "Episode.h"

@implementation Episode
@synthesize name;
@synthesize body;
@synthesize published_at;
@synthesize video_url;

+ (RKObjectMapping*) initMapping {
    RKObjectMapping* episodeMapping = [RKObjectMapping mappingForClass:[Episode class]];
    [episodeMapping mapKeyPath:@"name" toAttribute:@"name"];
    [episodeMapping mapKeyPath:@"notes" toAttribute:@"body"];
    [episodeMapping mapKeyPath:@"published_at" toAttribute:@"published_at"];
    [episodeMapping mapKeyPath:@"video_url" toAttribute:@"video_url"];
    
}
@end
