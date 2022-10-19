import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/src/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
const appId = "d080f4efff154a45aebf7d16bfe7f67a";
const token =
    "00639f6dbf520994e1b9ef2e127dbc7c3acIAAff5w2LNSvUAlznURlah95zYGDQZxvcEQw5tyofe7ZJ9zDPrsAAAAAEACQKMvtzKPSYgEAAQDMo9Ji";

class VidioCall extends StatefulWidget {
  const VidioCall({Key? key}) : super(key: key);

  @override
  State<VidioCall> createState() => _VidioCallState();
}

class _VidioCallState extends State<VidioCall> {
  late int _remoteId;

  late RtcEngine _engine;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initForAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();
    _engine = await RtcEngine.create("eea35a29e63640c58179685ee868a8d5");

    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteId = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteId = 0;
          });
        },
      ),
    );
    await _engine.joinChannel(token, "firstchannel", null, 0);

  }

  Future<void> initForAgora() async {await [Permission.microphone,Permission.camera].request();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agora vidio call"),
      ),
      body: Stack(
        children: [
          Center(
            child: _renderRemoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 100,
              height: 100,
              child: Center(
                child: _renderLocalPreview(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderLocalPreview() {
    return Container();
  }

  Widget? _renderRemoteVideo() {
    if (_remoteId != null) {
     return   RtcRemoteView.SurfaceView(uid: _remoteId,channelId: "");
    } else {
      return Text(
        "please wait",
        textAlign: TextAlign.center,
      );
    }
  }
}
