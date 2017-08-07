using System;
using ObjCRuntime;

[assembly: LinkWith ("libMp3Lame.a", LinkTarget.ArmV7 | LinkTarget.ArmV7s, ForceLoad = true)]
