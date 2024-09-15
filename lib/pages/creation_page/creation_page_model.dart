import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bg_blur/bg_blur_widget.dart';
import '/components/image_results/image_results_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import 'creation_page_widget.dart' show CreationPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class CreationPageModel extends FlutterFlowModel<CreationPageWidget> {
  ///  Local state fields for this page.

  String? sketch;

  bool? darkMode;

  bool? animateMessage;

  ///  State fields for stateful widgets in this page.

  // Model for bgBlur component.
  late BgBlurModel bgBlurModel;
  // State field(s) for Signature widget.
  SignatureController? signatureController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String uploadedSignatureUrl = '';
  // Stores action output result for [Backend Call - API (Create Prediction)] action in Button widget.
  ApiCallResponse? createPrediction;
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Get Prediction)] action in Button widget.
  ApiCallResponse? getPrediction;

  @override
  void initState(BuildContext context) {
    bgBlurModel = createModel(context, () => BgBlurModel());
  }

  @override
  void dispose() {
    bgBlurModel.dispose();
    signatureController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    instantTimer?.cancel();
  }
}
