package com.medikalam.app.medikalam;

import android.os.Bundle;
import android.util.Log;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;

import com.afpensdk.pen.DPenCtrl;
import com.afpensdk.pen.PaperSize;
import com.afpensdk.pen.penmsg.IAFPenMsgListener;
import com.afpensdk.pen.penmsg.IAFPenDotListener;
import com.afpensdk.pen.penmsg.PenMsg;
import com.afpensdk.pen.penmsg.PenMsgType;
import com.afpensdk.pen.penmsg.PenGripStyle;
import com.afpensdk.structure.AFDot;

import org.json.JSONObject;
import org.json.JSONException;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.afpensdk.pen.dpenctrl";
    private static final String EVENT_CHANNEL_MSG = "com.afpensdk.pen.dpenctrl/penMsgStream";
    private static final String EVENT_CHANNEL_DOT = "com.afpensdk.pen.dpenctrl/penDotStream";

    private EventChannel.EventSink eventSinkIAFPenMsg;
    private EventChannel.EventSink eventSinkIAFPenDot;

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        
        // Register ConsoleLogCapturePlugin
        flutterEngine.getPlugins().add(new ConsoleLogCapturePlugin());

        new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), EVENT_CHANNEL_MSG)
            .setStreamHandler(new EventChannel.StreamHandler() {
                @Override
                public void onListen(Object args, EventChannel.EventSink events) {
                    Log.d("MainActivity", "adding listener");
                    eventSinkIAFPenMsg = events;
                }

                @Override
                public void onCancel(Object args) {
                    Log.d("MainActivity", "cancelling listener");
                    eventSinkIAFPenMsg = null;
                }
            });

        new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), EVENT_CHANNEL_DOT)
            .setStreamHandler(new EventChannel.StreamHandler() {
                @Override
                public void onListen(Object args, EventChannel.EventSink events) {
                    Log.d("MainActivity", "adding listener");
                    eventSinkIAFPenDot = events;
                }

                @Override
                public void onCancel(Object args) {
                    Log.d("MainActivity", "cancelling listener");
                    eventSinkIAFPenDot = null;
                }
            });

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler((call, result) -> {
                if (call.method.equals("btStartForPeripheralsList")) {
                    int returnValue = DPenCtrl.getInstance().btStartForPeripheralsList(this);
                    result.success(returnValue);
                } else if (call.method.equals("setContext")) {
                    PaperSize paperSize = new PaperSize();
                    paperSize.height = 7014;
                    paperSize.width = 4962;
                    paperSize.pageFrom = 0;
                    paperSize.pageTo = 1000;
                    paperSize.bookNum = 1;

                    DPenCtrl.getInstance().SetPaperSize(java.util.Collections.singletonList(paperSize));
                    DPenCtrl.getInstance().setContext(this);
                    result.success(null);
                } else if (call.method.equals("setListener")) {
                    setListener();
                    result.success(null);
                } else if (call.method.equals("connect")) {
                    String strAddress = call.argument("addr");
                    DPenCtrl.getInstance().connect(strAddress);
                    result.success(null);
                } else if (call.method.equals("disconnect")) {
                    DPenCtrl.getInstance().disconnect();
                    result.success(null);
                } else {
                    result.notImplemented();
                }
            });
    }

    private void setListener() {
        IAFPenMsgListener listenerMsg = new IAFPenMsgListener() {
            @Override
            public void onReceiveMessage(PenMsg penMsg) {
                JSONObject jsonObject = new JSONObject();
                try {
                    switch (penMsg.penMsgType) {
                        case PenMsgType.FIND_DEVICE:
                            jsonObject = penMsg.getContentByJSONObject();
                            jsonObject.put("penMsgType", penMsg.penMsgType);
                            eventSinkIAFPenMsg.success(jsonObject.toString());
                            break;
                        case PenMsgType.PEN_CONNECTION_SUCCESS:
                            jsonObject.put("success", 1);
                            eventSinkIAFPenMsg.success(jsonObject.toString());
                            break;
                        case PenMsgType.PEN_DISCONNECTED:
                            jsonObject.put("disconnected", 0);
                            eventSinkIAFPenMsg.success(jsonObject.toString());
                            break;
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };

        IAFPenDotListener listenerDot = new IAFPenDotListener() {
            @Override
            public void onReceiveDot(AFDot dot) {
                if (eventSinkIAFPenDot == null) {
                    Log.w("MainActivity", "eventSinkIAFPenDot is not initialized yet");
                    return;
                }
                JSONObject jsonObject = new JSONObject();
                try {
                    jsonObject.put("x", dot.X);
                    jsonObject.put("y", dot.Y);
                    jsonObject.put("type", dot.type);
                    jsonObject.put("page", dot.page);
                    jsonObject.put("book_no", dot.book_no);
                    jsonObject.put("book_width", dot.book_width);
                    jsonObject.put("book_height", dot.book_height);
                    jsonObject.put("offset", dot.mOffset);
                    jsonObject.put("reserved1", dot.reserved1);
                    Log.d("MainActivity", jsonObject.toString());
                    eventSinkIAFPenDot.success(jsonObject.toString());
                } catch (JSONException e) {
                    Log.e("MainActivity", e.toString());
                    e.printStackTrace();
                }
            }

            @Override
            public void onReceiveGripStyle(PenGripStyle style) {
                // TODO
            }
        };

        DPenCtrl.getInstance().setDotListener(listenerDot);
        DPenCtrl.getInstance().setListener(listenerMsg);
    }
}
