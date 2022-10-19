import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:permission_handler/permission_handler.dart';

const APP_ID ="cb2dddadb8bb45968c33f25a084a6def";
const Token ="006cb2dddadb8bb45968c33f25a084a6defIABhF72jEciSfS4BKKn/cgwnkx1Myu9LWjIHFiyak52CHyzax3wAAAAAEAAE2jd413nFYgEAAQDWecVi";


class Vidiocall extends StatefulWidget {

  @override
  _VidiocallState createState() => _VidiocallState();
}
class _VidiocallState extends State<Vidiocall> {
  bool _joined = false;
  int _remoteUid = 0;
  bool _switch = false;
   bool muted = false;

   RtcEngine? engine;


  @override
  void initState() {
    super.initState();
    initPlatformState();
    engine?.enableVideo();
  }


  Future<void> initPlatformState() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await [Permission.microphone, Permission.camera,Permission.bluetooth].request();
    }

    RtcEngineContext context = RtcEngineContext(APP_ID);
    var engine = await RtcEngine.createWithContext(context);
    engine.setEventHandler(RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          setState(() {
            _joined = true;
          });
        }, userJoined: (int uid, int elapsed) {
      setState(() {
        _remoteUid = uid;
      });
    }, userOffline: (int uid, UserOfflineReason reason) {
      setState(() {
        _remoteUid = 0;
      });
    }));
    await engine.enableVideo();
    await engine.joinChannel(Token, 'video', null, 0);

  }

  mute() {
    setState(() {
      muted = !muted;
      engine?.muteLocalAudioStream(muted);
    });


  }
  SwitchCamera() {
    setState(() {
      engine?.switchCamera();
    });

  }
  onCallEnd(BuildContext context) {
    Navigator.pop(context);

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('video call'),
        ),
        body: Stack(
          children: [
            Center(
           child:_renderRemoteVideo(),
              //child: _switch ? _renderRemoteVideo() : _renderLocalPreview(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 120,
                height: 120,
                color: Colors.blue,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _switch = !_switch;
                    });
                  },
                  child: Center(
                    child:
                     _renderLocalPreview()
                   // _switch ? _renderLocalPreview() : _renderRemoteVideo(),
                  ),
                ),
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {mute();
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: Icon(
                          muted
                              ? Icons.mic_off_outlined
                              : Icons.mic_none_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        onCallEnd(context);
                      },
                      child: Container(
                        width: 65,
                        height: 65,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.redAccent,
                        ),
                        child: const Icon(
                          Icons.call_end,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        engine?.switchCamera();
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        child: const Icon(
                          Icons.flip_camera_ios_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _renderLocalPreview() {
    if (_joined && defaultTargetPlatform == TargetPlatform.android ) {
      return RtcLocalView.SurfaceView();
    }

    if (_joined && defaultTargetPlatform == TargetPlatform.windows) {
      return RtcLocalView.TextureView();
    }

    else {
      return const Text(
        'no found',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _renderRemoteVideo() {
    if (_remoteUid != 0 && defaultTargetPlatform == TargetPlatform.android ) {
      return RtcRemoteView.SurfaceView(
        uid: _remoteUid,
        channelId: "video",
      );
    }

    if (_remoteUid != 0 && defaultTargetPlatform == TargetPlatform.windows) {
      return RtcRemoteView.TextureView(
        uid: _remoteUid,
        channelId: "video",
      );
    }

    else {
      return const Text(
        'no fond......',
        textAlign: TextAlign.center,
      );
    }
  }
}
