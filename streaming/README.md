# Streaming

Refer to [TRaSH-Guides](https://trash-guides.info/) for setup and recommended settings.

Recyclarr can be used to automatically sync settings.

## Intel Transcoding

https://github.com/intel/media-driver#components-and-features

To enable low-power for Jasper Lake a kernel parameter must be set
```bash
"options i915 enable_guc=2" > /etc/modprobe.d/i915.conf
```
