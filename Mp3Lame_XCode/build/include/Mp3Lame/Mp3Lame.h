//
//  LameLib2.h
//  LameLib2
//
//  Created by haknode on 24/08/16.
//  Copyright © 2016 haknode. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "lame.h"

@interface Mp3Lame : NSObject

+ (NSString * _Nullable) getLameVersion;
- (void) initLame;
- (int) encodeBufferInterleaved:(short int[]) pcm :(int) num_samples :(unsigned char []) mp3buf :(int) mp3buf_size;
- (int) encodeBufferFlush:(unsigned char []) mp3buf :(int) mp3buf_size;
- (void) setInSampleRate:(int) sampleRate;
- (void) setVBR;
- (void) initParams;
- (void) close;


@end
