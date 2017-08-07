//
//  LameLib2.m
//  LameLib2
//
//  Created by haknode on 24/08/16.
//  Copyright © 2016 haknode. All rights reserved.
//

#import "Mp3Lame.h"

@implementation Mp3Lame
{
    lame_t _lame;
}

- (void) initLame
{
    _lame = lame_init();
}

+ (NSString * _Nullable) getLameVersion
{
    return [NSString stringWithUTF8String: get_lame_version()];
}

- (int) encodeBufferInterleaved:(short int[]) pcm :(int) num_samples :(unsigned char []) mp3buf :(int) mp3buf_size
{
    return lame_encode_buffer_interleaved(_lame, pcm, num_samples, mp3buf, mp3buf_size);
}

- (int) encodeBufferFlush:(unsigned char []) mp3buf :(int) mp3buf_size
{
    return lame_encode_flush(_lame, mp3buf, mp3buf_size);
}

- (void) setInSampleRate:(int) sampleRate
{
    lame_set_in_samplerate(_lame, sampleRate);
}

- (void) setVBR
{
    lame_set_VBR(_lame, vbr_default);
}

- (void) initParams
{
    lame_init_params(_lame);
}

- (void) close
{
    lame_close(_lame);
}


// Example code from https://github.com/rpplusplus/iOSMp3Recorder
// + (void) toMp3
// {
    // NSString *cafFilePath =[NSTemporaryDirectory() stringByAppendingString:@"RecordedFile"];
    
    // NSString *mp3FileName = @"Mp3File";
    // mp3FileName = [mp3FileName stringByAppendingString:@".mp3"];
    // NSString *mp3FilePath = [[NSHomeDirectory() stringByAppendingFormat:@"/Documents/"] stringByAppendingPathComponent:mp3FileName];
    
    // @try {
        // int read, write;
        
        // FILE *pcm = fopen([cafFilePath cStringUsingEncoding:1], "rb");  //source
        // fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
        // FILE *mp3 = fopen([mp3FilePath cStringUsingEncoding:1], "wb");  //output
        
        // const int PCM_SIZE = 8192;
        // const int MP3_SIZE = 8192;
        // const int sampleRate = 41000;
        // short int pcm_buffer[PCM_SIZE*2];
        // unsigned char mp3_buffer[MP3_SIZE];
        
        // lame_t lame = lame_init();
        // lame_set_in_samplerate(lame, sampleRate);
        // lame_set_VBR(lame, vbr_default);
        // lame_init_params(lame);
        
        // do {
            // read = fread(pcm_buffer, 2*sizeof(short int), PCM_SIZE, pcm);
            // if (read == 0)
                // write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            // else
                // write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            // fwrite(mp3_buffer, write, 1, mp3);
            
        // } while (read != 0);
        
        // lame_close(lame);
        // fclose(mp3);
        // fclose(pcm);
    // }
    // @catch (NSException *exception) {
        // NSLog(@"//@",[exception description]);
    // }
    // @finally {
        
    // }
// }

@end
