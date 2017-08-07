using Foundation;

// @interface Mp3Lame : NSObject
[BaseType (typeof(NSObject))]
interface Mp3Lame
{
	// +(NSString * _Nullable)getLameVersion;
	[Static]
	[NullAllowed, Export ("getLameVersion")]
	[Verify (MethodToProperty)]
	string LameVersion { get; }

	// -(void)initLame;
	[Export ("initLame")]
	void InitLame ();

	// -(int)encodeBufferInterleaved:(short *)pcm :(int)num_samples :(unsigned char *)mp3buf :(int)mp3buf_size;
	[Export ("encodeBufferInterleaved::::")]
	int EncodeBufferInterleaved (short[] pcm, int num_samples, byte[] mp3buf, int mp3buf_size);

	// -(int)encodeBufferFlush:(unsigned char *)mp3buf :(int)mp3buf_size;
	[Export ("encodeBufferFlush::")]
	int EncodeBufferFlush (byte[] mp3buf, int mp3buf_size);

	// -(void)setInSampleRate:(int)sampleRate;
	[Export ("setInSampleRate:")]
	void SetInSampleRate (int sampleRate);

	// -(void)setVBR;
	[Export ("setVBR")]
	void SetVBR ();

	// -(void)initParams;
	[Export ("initParams")]
	void InitParams ();

	// -(void)close;
	[Export ("close")]
	void Close ();
}
