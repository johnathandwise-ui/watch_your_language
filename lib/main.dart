// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 1 OF 25
// NATIVE CORE HARDWARE LAYOUT IMPORTS
// ==========================================
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:html' as html;
import 'package:video_player/video_player.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<CameraDescription> availableSystemLenses = [];
  try {
    availableSystemLenses = await availableCameras();
  } catch (_) {}
  runApp(WatchYourLanguageApp(cameras: availableSystemLenses));
}

class WatchYourLanguageApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const WatchYourLanguageApp({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch Your Language',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        primaryColor: const Color(0xFFD4AF37),
      ),
      home: LanguageSelectorScreen(cameras: cameras),
    );
  }
}
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 2 OF 25
// SIMULATED ADMOB BANNER UNIT DECK LAYOUTS
// ==========================================
Widget _buildAdMobPlaceholderBannerUnit(String contextPlacementLabel) {
  return Container(
    width: double.infinity,
    height: 60,
    margin: const EdgeInsets.symmetric(vertical: 4),
    decoration: BoxDecoration(
      color: const Color(0xFF121214),
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.amber.shade700.withOpacity(0.4), width: 1),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 4, offset: const Offset(0, 2))
      ],
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: Colors.amber.shade700, borderRadius: BorderRadius.circular(4)),
            child: const Text("Ad", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "GOOGLE ADMOB TEST BANNER",
              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.2),
            ),
            const SizedBox(height: 2),
            Text(
              "ID: ca-app-pub-3940256099942544/6300978111 ($contextPlacementLabel)",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 8, fontFamily: 'Arial'),
            ),
          ],
        ),
        Positioned(
          right: 12,
          child: Icon(Icons.info_outline, size: 16, color: Colors.grey.shade600),
        ),
      ],
    ),
  );
}
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCKS 3, 4, 5 & 6 OF 25
// UNIFIED MASTER CANVAS WITH TYPE-SAFE GRADIENT FLOODED TILES
// ==========================================
class LanguageSelectorScreen extends StatelessWidget {
  final List<CameraDescription> cameras;
  const LanguageSelectorScreen({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> languageGridList = [
      {'name': 'Spanish', 'flag': '🇪🇸', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)]},
      {'name': 'French', 'flag': '🇫🇷', 'colors': [const Color(0xFF0055A5), const Color(0xFFFFFFFF), const Color(0xFFEF4135)]},
      {'name': 'German', 'flag': '🇩🇪', 'colors': [const Color(0xFF000000), const Color(0xFFFF0000), const Color(0xFFFFCC00)]},
      {'name': 'Italian', 'colors': [const Color(0xFF009246), const Color(0xFFFFFFFF), const Color(0xFFCE2B37)], 'flag': '🇮🇹'},
      {'name': 'Japanese', 'flag': '🇯🇵', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFBC002D), const Color(0xFFFFFFFF)]},
      {'name': 'Portuguese', 'flag': '🇵🇹', 'colors': [const Color(0xFF006600), const Color(0xFFFF0000)]},
      {'name': 'Dutch', 'flag': '🇳🇱', 'colors': [const Color(0xFFAE1C28), const Color(0xFFFFFFFF), const Color(0xFF21468B)]},
      {'name': 'Swedish', 'flag': '🇸🇪', 'colors': [const Color(0xFF006AA7), const Color(0xFFFECC00)]},
      {'name': 'Korean', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFCD2E3A), const Color(0xFF0047A0)], 'flag': '🇰🇷'},
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.center, children: [
                    Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 2.0..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 3), blurRadius: 6, color: Colors.red.shade900)])),
                    const Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white)),
                  ]),
                  Stack(alignment: Alignment.center, children: [
                    Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 2.0..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 3), blurRadius: 6, color: Colors.red.shade900)])),
                    const Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900, color: Colors.white)),
                  ]),
                  const SizedBox(height: 8),
                  Text("THE ULTIMATE TELEPROMPTER GAME", style: TextStyle(color: Colors.amber.shade600, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 2.0)),
                ],
              ),
              const SizedBox(height: 40),
              
              Expanded(
                child: GridView.builder(
                  itemCount: languageGridList.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.85),
                  itemBuilder: (context, index) {
                    final item = languageGridList[index];
                    final List<Color> activeFlagColors = item['colors'] as List<Color>;
                    
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => GameLoopScreen(cameras: cameras, languageName: item['name'] as String)));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 8, offset: const Offset(0, 4))],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xFF0F0F12),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    gradient: LinearGradient(
                                      colors: activeFlagColors.map((color) => color.withOpacity(0.18)).toList(),
                                      begin: Alignment.topLeft, end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(item['flag'] as String, style: const TextStyle(fontSize: 34)),
                                    const SizedBox(height: 10),
                                    // 🎯 FIXED WEIGHT PARAMETER: Changed invalid 'FontWeight.black' to type-safe 'FontWeight.w900'
                                    Text(
                                      (item['name'] as String).toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 0.8, shadows: [Shadow(blurRadius: 4, color: Colors.black, offset: Offset(0, 1))]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GameLoopScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String languageName;
  const GameLoopScreen({super.key, required this.cameras, required this.languageName});

  @override
  State<GameLoopScreen> createState() => _GameLoopScreenState();
}

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 7 OF 25
// ACTIVE LIFECYCLE VARIABLES & SESSION TRACKERS
// ==========================================
class _GameLoopScreenState extends State<GameLoopScreen> {
  CameraController? _cameraController;
  final FlutterTts _flutterTts = FlutterTts();
  
  bool isLoading = true;
  bool isRehearsalPhase = false;
  bool isFullSentencePhase = false;
  bool isRecordingPhase = false;
  bool isPlaybackReviewPhase = false;
  bool _isDelayActive = false;
  bool _isScrollFinished = false;
  bool _isSpeakingActive = false;
  bool _hasListenedToCurrentWord = false; // Progressive layout token
  
  String finalEnglishMeaning = "";
  String compiledForeignSentence = "";
  List<String> _currentFlashcardWord = [];
  int currentWordIndex = 0;
  
  int productionCountdown = 3;
  bool isCountdownRunning = false;
  bool isCutButtonLocked = false;
  int adRefreshCounterSeed = 0;
  
  String networkTrafficStatusHUD = "📡 MATRICES ONLINE...";
  static final List<String> _sessionHistoryKeys = [];
  
  Timer? _countdownTimer;
  ScrollController? _prompterScrollController;
  VideoPlayerController? _reviewVideoController;
  String? _recordedVideoUrl;

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 8 OF 25
// COMPONENT INITSTATE & ON-DEMAND HARDWARE HOOKS
// ==========================================
  @override
  void initState() {
    super.initState();
    _prompterScrollController = ScrollController();
    finalEnglishMeaning = "";
    compiledForeignSentence = "";
    _currentFlashcardWord = [];
    currentWordIndex = 0;
    _bootstrapStudioHardware();
  }

  void _bootstrapStudioHardware() {
    _fetchCuratedGistJokesRepository();
  }

  Future<void> _triggerLazyCameraHardwareActivation() async {
    if (widget.cameras.isEmpty) {
      if (mounted) { setState(() { networkTrafficStatusHUD = "❌ NO CAMERAS FOUND"; }); }
      return;
    }
    if (_cameraController != null) return;

    final CameraDescription frontCam = widget.cameras.firstWhere(
      (CameraDescription c) => c.lensDirection == CameraLensDirection.front,
      orElse: () => widget.cameras.first,
    );
    
    _cameraController = CameraController(frontCam, ResolutionPreset.medium, enableAudio: true);
    try {
      await _cameraController!.initialize();
      if (mounted) { setState(() {}); }
    } catch (e) {
      if (mounted) { setState(() { networkTrafficStatusHUD = "❌ CAMERA ERROR: $e"; }); }
    }
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 9 OF 25
// LIVE UN-CACHED GIST JOKES DATA PIPELINE LOADER
// ==========================================
  void _fetchCuratedGistJokesRepository() async {
    _sessionHistoryKeys.clear();
    if (mounted) {
      setState(() {
        isLoading = true; isRehearsalPhase = false; isFullSentencePhase = false;
        isRecordingPhase = false; isPlaybackReviewPhase = false;
      });
    }
    
    final String g1 = "gist.";
    final String g2 = "githubuser";
    final String g3 = "content.com";
    final String cleanGistDomain = "$g1$g2$g3";

    const String d2 = "johnathandwise-ui";
    const String d3 = "3d31638a9fed18672921e7eee0dafb3e";
    const String d4 = "raw"; 
    const String d5 = "phrases.json";
    
    final String dynamicTimestampToken = DateTime.now().millisecondsSinceEpoch.toString();
    final String activeDirectRawLink = "https://$cleanGistDomain/$d2/$d3/$d4/$d5?cb=$dynamicTimestampToken";
    
    try {
      final http.Response response = await http.get(Uri.parse(activeDirectRawLink)).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final List<dynamic> downloadedJsonList = json.decode(response.body) as List<dynamic>;
        List<dynamic> availablePool = downloadedJsonList.where((item) => !_sessionHistoryKeys.contains(item["english"] as String)).toList();
        if (availablePool.isEmpty) { _sessionHistoryKeys.clear(); availablePool = downloadedJsonList; }
        final Random randomSeed = Random();
        final Map<String, dynamic> chosenJokeMap = availablePool[randomSeed.nextInt(availablePool.length)] as Map<String, dynamic>;
        _translateAndParseEnglishPayload(chosenJokeMap["english"] as String);
        return;
      }
    } catch (_) {}
    _translateAndParseEnglishPayload("I am not lazy, I am just in energy saving mode.");
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 10 OF 25
// RESTORED AUTOMATIC ASIAN CHARACTER SLOT FILTER
// ==========================================
  void _translateAndParseEnglishPayload(String englishSentence) async {
    _sessionHistoryKeys.add(englishSentence);
    String targetLangCode = "es";
    switch (widget.languageName) {
      case 'Spanish': targetLangCode = "es"; break;
      case 'French': targetLangCode = "fr"; break;
      case 'German': targetLangCode = "de"; break;
      case 'Italian': targetLangCode = "it"; break;
      case 'Japanese': targetLangCode = "ja"; break;
      case 'Portuguese': targetLangCode = "pt"; break;
      case 'Dutch': targetLangCode = "nl"; break;
      case 'Swedish': targetLangCode = "sv"; break;
      case 'Korean': targetLangCode = "ko"; break;
    }

    String translatedSentence = "";
    bool parseSucceeded = false;

    try {
      final String token1 = "trans";
      final String token2 = "late.google";
      final String token3 = "apis.com";
      final String fullCleanDomain = "$token1$token2$token3";
      
      final String gEndpoint = "translate_a/single";
      final String gParams = "client=gtx&sl=en&tl=$targetLangCode&dt=t&q=${Uri.encodeComponent(englishSentence)}";
      final String completeTranslationUrl = "https://$fullCleanDomain/$gEndpoint?$gParams";
      
      final http.Response response = await http.get(Uri.parse(completeTranslationUrl)).timeout(const Duration(seconds: 5));
      
      if (response.statusCode == 200) {
        final dynamic outerRawData = json.decode(response.body);
        
        // 🎯 THE HISTORIC FIX: Explicitly drills to index 0,0,0 to grab pure text and ignore array code
        if (outerRawData is List && outerRawData.isNotEmpty && outerRawData[0] is List && outerRawData[0].isNotEmpty) {
          final List firstMatrixRow = outerRawData[0] as List;
          StringBuffer sentenceBuffer = StringBuffer();
          
          for (var segment in firstMatrixRow) {
            if (segment is List && segment.isNotEmpty && segment[0] != null) {
              sentenceBuffer.write(segment[0].toString());
            }
          }
          
          if (sentenceBuffer.isNotEmpty) {
            translatedSentence = sentenceBuffer.toString().trim();
            parseSucceeded = true;
          }
        }
      }
    } catch (_) {}

    if (!parseSucceeded || translatedSentence.isEmpty) {
      translatedSentence = englishSentence;
    }

    List<String> parsedWordsList = [];
    if (widget.languageName == 'Japanese' || widget.languageName == 'Korean') {
      // Clean out lingering punctuation symbols before parsing
      final String cleanAsianText = translatedSentence.replaceAll(RegExp(r'[^\p{L}\p{N}]+', unicode: true), '').trim();
      
      // Splits characters smoothly while dropping empty formatting artifact strings completely
      parsedWordsList = cleanAsianText.characters
          .map((String char) => char.trim())
          .where((String char) => char.isNotEmpty && char != "[" && char != "]" && char != ",")
          .toList();
    } else {
      final String cleanWesternText = translatedSentence.replaceAll(RegExp(r'[^\p{L}\p{N}\s]+', unicode: true), '').trim();
      parsedWordsList = cleanWesternText.split(" ").where((String w) => w.trim().isNotEmpty).toList();
    }

    if (mounted) {
      setState(() {
        finalEnglishMeaning = englishSentence;
        compiledForeignSentence = translatedSentence;
        _currentFlashcardWord = parsedWordsList;
        currentWordIndex = 0;
        isLoading = false;
        isRehearsalPhase = true;
      });
      _startCueCardCacheImpressionTimer();
    }
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 11 OF 25
// SILENT CARD ENTRANCE & AD IMPRESSION BUFFERS
// ==========================================
  void _startCueCardCacheImpressionTimer() {
    if (!mounted) return;
    
    // Enforce total silence upon landing on a card. Audio only fires when user taps "LISTEN".
    setState(() { 
      _isDelayActive = true; 
    });
    
    Timer(const Duration(milliseconds: 1200), () {
      if (mounted) { 
        setState(() { _isDelayActive = false; }); 
      }
    });
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 12 OF 25
// CARD ROUTER STEPS & RESETTABLE LISTEN TRIGGERS
// ==========================================
  void _advanceWordIndexTrackerOrRouteNext() {
    if (!mounted) return;
    
    setState(() { 
      _isSpeakingActive = true;
      _hasListenedToCurrentWord = false; // Reset flag guarantees the next card starts with "LISTEN"
    });
    
    if (currentWordIndex < _currentFlashcardWord.length - 1) {
      setState(() { currentWordIndex++; });
      _startCueCardCacheImpressionTimer();
    } else {
      setState(() { isRehearsalPhase = false; isFullSentencePhase = true; });
    }
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 13 OF 25
// WEB CLOUD-STREAMING ACCENT VOICES ENGINE
// ==========================================
  void _executeVoicePronunciationEngine(String textToSpeak) async {
    if (textToSpeak.isEmpty || textToSpeak == "LOADING...") return;
    String ttsLocaleCode = "es"; 
    
    switch (widget.languageName) {
      case 'Spanish': ttsLocaleCode = "es"; break;     
      case 'French': ttsLocaleCode = "fr"; break;      
      case 'German': ttsLocaleCode = "de"; break;      
      case 'Italian': ttsLocaleCode = "it"; break;     
      case 'Japanese': ttsLocaleCode = "ja"; break;    
      case 'Portuguese': ttsLocaleCode = "pt"; break;  
      case 'Dutch': ttsLocaleCode = "nl"; break;       
      case 'Swedish': ttsLocaleCode = "sv"; break;     
      case 'Korean': ttsLocaleCode = "ko"; break;      
    }
    
    if (mounted) { setState(() { _isSpeakingActive = true; }); }
    
    try {
      final String streamToken1 = "://google.com";
      final String streamToken2 = "translate_tts";
      final String cleanPayloadText = Uri.encodeComponent(textToSpeak);
      final String streamingAudioUrl = "https://$streamToken1/$streamToken2?ie=UTF-8&tl=$ttsLocaleCode&client=tw-ob&q=$cleanPayloadText";
      
      await _flutterTts.speak(textToSpeak); 
      
      final dynamic htmlAudioElement = html.AudioElement(streamingAudioUrl);
      htmlAudioElement.play();
    } catch (_) {}

    int wordLengthCalculationWeight = textToSpeak.length * 110; 
    int absoluteMinimumBufferWindow = wordLengthCalculationWeight < 750 ? 750 : wordLengthCalculationWeight;
    if (absoluteMinimumBufferWindow > 4000) absoluteMinimumBufferWindow = 4000; 
    
    Timer(Duration(milliseconds: absoluteMinimumBufferWindow), () {
      if (mounted) { 
        setState(() { _isSpeakingActive = false; }); 
        _triggerAdRefresherIncrement(); 
      }
    });
  }

  void _triggerAdRefresherIncrement() {
    if (mounted) { setState(() { adRefreshCounterSeed++; }); }
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 14 OF 25
// MASTER UI PHASE ROUTER SWITCH ENGINE
// ==========================================
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return _buildStudioLoadingSpinnerScreen();
    }
    if (isRehearsalPhase) {
      return _buildWordByWordRehearsalScreen();
    }
    if (isFullSentencePhase) {
      return _buildFullSentencePresentationScreen();
    }
    if (isRecordingPhase) {
      return _buildLiveStudioRecordingScreen();
    }
    if (isPlaybackReviewPhase) {
      return _buildPostProductionReviewScreen();
    }
    
    return _buildStudioLoadingSpinnerScreen();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _prompterScrollController?.dispose();
    _cameraController?.dispose();
    super.dispose();
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 15 & 16 OF 25
// TELEPROMPTER TIMELINES & SIMULATED AD SYSTEMS WITH LOADING SCREENS
// ==========================================
 // ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 15 OF 25
// TELEPROMPTER TIMELINES & VIDEO CAPTURE SAVER
// ==========================================
  void _startLiveStudioVideoCaptureStream() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;
    try {
      await _cameraController!.startVideoRecording();
      if (mounted) { setState(() { isCutButtonLocked = false; }); }
      _initializeDualScrollingTeleprompter();
    } catch (_) {}
  }

  void _initializeDualScrollingTeleprompter() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (_prompterScrollController != null && _prompterScrollController!.hasClients) {
        final double maxScrollExtent = _prompterScrollController!.position.maxScrollExtent;
        _prompterScrollController!.animateTo(maxScrollExtent, duration: const Duration(seconds: 12), curve: Curves.linear).then((_) {
          if (mounted) { setState(() { _isScrollFinished = true; }); }
        });
      }
    });
  }

  void _stopRecordingAndLaunchInterstitialVideoAd() async {
    if (_cameraController == null || !_cameraController!.value.isRecordingVideo) return;
    try {
      // 🎯 CAPTURE FILES: Grabs the physical video file directly from the hardware recording cache
      final XFile recordedVideoFile = await _cameraController!.stopVideoRecording();
      _recordedVideoUrl = recordedVideoFile.path;
      
      // Initialize the looping video playback engine using the saved path token
      _reviewVideoController = VideoPlayerController.networkUrl(Uri.parse(_recordedVideoUrl!));
      await _reviewVideoController!.initialize();
      await _reviewVideoController!.setLooping(true);
      _reviewVideoController!.play();

      _cameraController?.dispose();
      _cameraController = null;
      
      if (mounted) { setState(() { isLoading = true; isRecordingPhase = false; }); }
      Timer(const Duration(milliseconds: 2000), () {
        if (mounted) { setState(() { isLoading = false; isPlaybackReviewPhase = true; }); }
      });
    } catch (_) {}
  }

  // 🎯 DEFINED COMPONENT: Resolves undefined method errors by building the gold studio loader
  Widget _buildStudioLoadingSpinnerScreen() {
    return const Scaffold(
      backgroundColor: Color(0xFF0A0A0A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Color(0xFFD4AF37), strokeWidth: 4),
            SizedBox(height: 24),
            Text(
              "LOADING GAME MATRICES...",
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 2.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullscreenSimulationInterstitialVideoAdOverlay() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(gradient: RadialGradient(colors: [Color(0xFF1E1E24), Color(0xFF0A0A0C)], radius: 1.2)),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(padding: const EdgeInsets.all(16), decoration: const BoxDecoration(color: Color(0xFFD4AF37), shape: BoxShape.circle), child: const Icon(Icons.play_circle_filled, size: 64, color: Colors.black)),
                    const SizedBox(height: 24),
                    // 🎯 FIXED CONSTANT WEIGHT TYPE: Replaced structural properties with valid text tokens
                    const Text("WATCH YOUR LANGUAGE PREMIUM", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
                    const SizedBox(height: 8),
                    const Text("OFFICIAL GOOGLE TEST INTERSTITIAL VIDEO AD", style: TextStyle(color: Color(0xFFFFC107), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
                    const SizedBox(height: 4),
                    const Text("ca-app-pub-3940256099942544/1033173712", style: TextStyle(color: Colors.grey, fontSize: 10, fontFamily: 'Arial')),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40, left: 24, right: 24,
            child: Container(
              height: 64, padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(color: const Color(0xFF1A1A1F), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade800)),
              child: Row(
                children: [
                  Container(width: 40, height: 40, decoration: BoxDecoration(color: const Color(0xFFD4AF37), borderRadius: BorderRadius.circular(8)), child: const Center(child: Icon(Icons.g_translate, color: Colors.black, size: 20))),
                  const SizedBox(width: 16),
                  const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text("Watch Your Language", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)), Text("Remove ads & unlock levels", style: TextStyle(color: Colors.grey, fontSize: 11))])),
                  ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))), onPressed: () {}, child: const Text("INSTALL", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12))),
                ],
              ),
            ),
          ),
          Positioned(
            top: 24, left: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.grey.shade800)),
              child: Row(
                children: [
                  Container(padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1), decoration: BoxDecoration(color: const Color(0xFFD4AF37), borderRadius: BorderRadius.circular(2)), child: const Text("Ad", style: TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold))),
                  const SizedBox(width: 6),
                  Text("Video will resume in: $productionCountdown", style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          Positioned(
            top: 24, right: 24,
            child: GestureDetector(
              onTap: productionCountdown > 0 ? null : () { setState(() { isPlaybackReviewPhase = true; }); },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: productionCountdown > 0 ? Colors.black.withOpacity(0.4) : const Color(0xFFD4AF37), shape: BoxShape.circle),
                child: Icon(productionCountdown > 0 ? Icons.lock_outline : Icons.close, size: 20, color: productionCountdown > 0 ? Colors.grey : Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 17 OF 25
// DYNAMIC FLAG-COLOR REHEARSAL EDGE SCAFFOLD WRAPPER
// ==========================================
  Widget _buildWordByWordRehearsalScreen() {
    // 🎯 NATIONAL COLOR LOOKUP MATRIX: Safely replicates room color tracks directly inside the rehearsal layout engine
    final List<Map<String, dynamic>> countryGridMap = [
      {'name': 'Spanish', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)]},
      {'name': 'French', 'colors': [const Color(0xFF0055A5), const Color(0xFFFFFFFF), const Color(0xFFEF4135)]},
      {'name': 'German', 'colors': [const Color(0xFF000000), const Color(0xFFFF0000), const Color(0xFFFFCC00)]},
      {'name': 'Italian', 'colors': [const Color(0xFF009246), const Color(0xFFFFFFFF), const Color(0xFFCE2B37)]},
      {'name': 'Japanese', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFBC002D), const Color(0xFFFFFFFF)]},
      {'name': 'Portuguese', 'colors': [const Color(0xFF006600), const Color(0xFFFF0000)]},
      {'name': 'Dutch', 'colors': [const Color(0xFFAE1C28), const Color(0xFFFFFFFF), const Color(0xFF21468B)]},
      {'name': 'Swedish', 'colors': [const Color(0xFF006AA7), const Color(0xFFFECC00)]},
      {'name': 'Korean', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFCD2E3A), const Color(0xFF0047A0)]},
    ];
    
    final Map<String, dynamic> activeLanguageData = countryGridMap.firstWhere((element) => element['name'] == widget.languageName, orElse: () => countryGridMap.first);
    final List<Color> dynamicFlagColors = activeLanguageData['colors'] as List<Color>;

    final String activeCueWord = _currentFlashcardWord.isNotEmpty && currentWordIndex < _currentFlashcardWord.length
        ? _currentFlashcardWord[currentWordIndex]
        : "LOADING...";
    final String flagIcon = '🏳️';

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: _buildAdMobPlaceholderBannerUnit("TOP REHEARSAL BANNER AD"),
            ),
            // 🎯 FIXED PASSTHROUGH: Sends the actual custom national flag colors straight to your cue card button layouts
            _buildCenterCueCardBlock(dynamicFlagColors, activeCueWord, flagIcon),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: _buildAdMobPlaceholderBannerUnit("BOTTOM REHEARSAL BANNER AD"),
            ),
          ],
        ),
      ),
    );
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 18 OF 25 (PART 1)
// ENHANCED BRAND LOGO PROFILE & RESTORED ROOM FLAGS
// ==========================================
  Widget _buildCenterCueCardBlock(List<Color> activeFlagColors, String activeCueWord, String flagIcon) {

    final List<Map<String, dynamic>> localizedCountryGridMap = [
      {'name': 'Spanish', 'flag': '🇪🇸'}, {'name': 'French', 'flag': '🇫🇷'}, {'name': 'German', 'flag': '🇩🇪'},
      {'name': 'Italian', 'flag': '🇮🇹'}, {'name': 'Japanese', 'flag': '🇯🇵'}, {'name': 'Portuguese', 'flag': '🇵🇹'},
      {'name': 'Dutch', 'flag': '🇳🇱'}, {'name': 'Swedish', 'flag': '🇸🇪'}, {'name': 'Korean', 'flag': '🇰🇷'},
    ];
    final Map<String, dynamic> activeLanguageData = localizedCountryGridMap.firstWhere((element) => element['name'] == widget.languageName, orElse: () => {'flag': '🏳️'});
    final String fullyRestoredFlagIcon = activeLanguageData['flag'] as String? ?? '🏳️';

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            const Spacer(flex: 1),
            GestureDetector(
              onTap: () { Navigator.pop(context); },
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(fullyRestoredFlagIcon, style: const TextStyle(fontSize: 32)),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Stack(alignment: Alignment.center, children: [
                        Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
                        const Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.white)),
                      ]),
                      Stack(alignment: Alignment.center, children: [
                        Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
                        const Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white)),
                      ]),
                      const SizedBox(height: 6),
                      Text(widget.languageName.toUpperCase(), style: const TextStyle(color: Color(0xFFFFC107), fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 2.5)),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Text(fullyRestoredFlagIcon, style: const TextStyle(fontSize: 32)),
                ],
              ),
            ),
                        const Spacer(flex: 2),
            const Text("SAY THIS WORD:", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            const SizedBox(height: 12),
            
            Container(
              width: double.infinity, 
              padding: const EdgeInsets.symmetric(vertical: 84), 
              decoration: BoxDecoration(color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade900, width: 2), boxShadow: [BoxShadow(color: Colors.red.shade900.withOpacity(0.35), blurRadius: 16, spreadRadius: 1, offset: const Offset(0, 4))]),
              child: _isDelayActive 
                  ? const Center(child: SizedBox(width: 32, height: 32, child: CircularProgressIndicator(color: Color(0xFFD4AF37), strokeWidth: 3)))
                  : Stack(alignment: Alignment.center, children: [
                      Text(activeCueWord.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, fontFamily: 'Arial', letterSpacing: 0.5, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 4), blurRadius: 10, color: Colors.red.shade900.withOpacity(0.85))])),
                      Text(activeCueWord.toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 38, fontWeight: FontWeight.w900, fontFamily: 'Arial', letterSpacing: 0.5, color: Colors.white)),
                    ]),
            ),
            
            const SizedBox(height: 12),
            Text("WORD ${currentWordIndex + 1} OF ${_currentFlashcardWord.length}", style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.bold)),
            
            const Spacer(flex: 3),
            
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: !_hasListenedToCurrentWord
                  ? Container(
                      key: const ValueKey('listen_primary_only'),
                      height: 54, width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                        onPressed: _isDelayActive ? null : () async { 
                          String targetLocale = "es-MX";
                          switch (widget.languageName) {
                            case 'Spanish': targetLocale = "es-MX"; break;
                            case 'French': targetLocale = "fr-FR"; break;
                            case 'German': targetLocale = "de-DE"; break;
                            case 'Italian': targetLocale = "it-IT"; break;
                            case 'Japanese': targetLocale = "ja-JP"; break;
                            case 'Portuguese': targetLocale = "pt-PT"; break;
                            case 'Dutch': targetLocale = "nl-NL"; break;
                            case 'Swedish': targetLocale = "sv-SE"; break;
                            case 'Korean': targetLocale = "ko-KR"; break;
                          }
                          await _flutterTts.setLanguage(targetLocale);
                          await _flutterTts.setSpeechRate(0.38);
                          _executeVoicePronunciationEngine(activeCueWord); 
                          setState(() { _hasListenedToCurrentWord = true; }); 
                        },
                        icon: const Icon(Icons.play_arrow, size: 20, color: Colors.black),
                        label: const Text("LISTEN", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black, letterSpacing: 1.2)),
                      ),
                    )
                  : Row(
                      key: const ValueKey('split_control_deck'),
                      children: [
                        Expanded(child: Container(height: 54, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]), child: ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: _isDelayActive ? null : () { _executeVoicePronunciationEngine(activeCueWord); }, icon: const Icon(Icons.volume_up, size: 18, color: Colors.black), label: const Text("HEAR AGAIN...", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: Colors.black, letterSpacing: 1.1))))),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            height: 54, 
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]), 
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), 
                              // 🎯 FIXED LOCATION: Declared the condition check parameters inline to bypass scope restriction issues smoothly
                              onPressed: (_isDelayActive || _isSpeakingActive) ? null : () { _advanceWordIndexTrackerOrRouteNext(); }, 
                              child: const Text("NEXT", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black, letterSpacing: 1.1))
                            )
                          )
                        ),
                      ],
                    ),
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 19 OF 25 (PART 1)
// SILENT FULL SENTENCE SCREEN HEADER & CHALLENGE CONTAINER
// ==========================================
  Widget _buildFullSentencePresentationScreen() {
    final List<Map<String, dynamic>> countryGridMap = [
      {'name': 'Spanish', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)], 'flag': '🇪🇸'},
      {'name': 'French', 'colors': [const Color(0xFF0055A5), const Color(0xFFFFFFFF), const Color(0xFFEF4135)], 'flag': '🇫🇷'},
      {'name': 'German', 'colors': [const Color(0xFF000000), const Color(0xFFFF0000), const Color(0xFFFFCC00)], 'flag': '🇩🇪'},
      {'name': 'Italian', 'colors': [const Color(0xFF009246), const Color(0xFFFFFFFF), const Color(0xFFCE2B37)], 'flag': '🇮🇹'},
      {'name': 'Japanese', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFBC002D), const Color(0xFFFFFFFF)], 'flag': '🇯🇵'},
      {'name': 'Portuguese', 'colors': [const Color(0xFF006600), const Color(0xFFFF0000)], 'flag': '🇵🇹'},
      {'name': 'Dutch', 'colors': [const Color(0xFFAE1C28), const Color(0xFFFFFFFF), const Color(0xFF21468B)], 'flag': '🇳🇱'},
      {'name': 'Swedish', 'colors': [const Color(0xFF006AA7), const Color(0xFFFECC00)], 'flag': '🇸🇪'},
      {'name': 'Korean', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFCD2E3A), const Color(0xFF0047A0)], 'flag': '🇰🇷'},
    ];
    final Map<String, dynamic> activeLanguageData = countryGridMap.firstWhere((element) => element['name'] == widget.languageName, orElse: () => countryGridMap.first);
    final List<Color> activeFlagColors = activeLanguageData['colors'] as List<Color>;
    final String activeFlagIcon = activeLanguageData['flag'] as String? ?? '🏳️';

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
              child: _buildAdMobPlaceholderBannerUnit("TOP SENTENCE BANNER AD"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    GestureDetector(
                      onTap: () { Navigator.pop(context); },
                      behavior: HitTestBehavior.opaque,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(activeFlagIcon, style: const TextStyle(fontSize: 32)),
                          const SizedBox(width: 16),
                          Column(
                            children: [
                              Stack(alignment: Alignment.center, children: [
                                Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
                                const Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.white)),
                              ]),
                              Stack(alignment: Alignment.center, children: [
                                Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
                                const Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: Colors.white)),
                              ]),
                              const SizedBox(height: 6),
                              Text(widget.languageName.toUpperCase(), style: const TextStyle(color: Color(0xFFFFC107), fontSize: 14, fontWeight: FontWeight.w900, letterSpacing: 2.5)),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Text(activeFlagIcon, style: const TextStyle(fontSize: 32)),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    const Text("THE FULL CHALLENGE SENTENCE:", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity, 
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 76),
                      decoration: BoxDecoration(color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade900, width: 2), boxShadow: [BoxShadow(color: Colors.red.shade900.withOpacity(0.35), blurRadius: 16, spreadRadius: 1, offset: const Offset(0, 4))]),
                      child: Text(compiledForeignSentence.toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'Arial', letterSpacing: 0.5)),
                    ),
                    const Spacer(flex: 3),
                    
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: !_hasListenedToCurrentWord
                          ? Container(
                              key: const ValueKey('sentence_listen_only'),
                              height: 54, width: double.infinity,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                                onPressed: () { 
                                  _executeVoicePronunciationEngine(compiledForeignSentence); 
                                  setState(() { _hasListenedToCurrentWord = true; }); 
                                },
                                icon: const Icon(Icons.play_arrow, size: 20, color: Colors.black),
                                label: const Text("LISTEN", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black, letterSpacing: 1.2)),
                              ),
                            )
                          : Row(
                              key: const ValueKey('sentence_split_deck'),
                              children: [
                                Expanded(child: Container(height: 54, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]), child: ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () { _executeVoicePronunciationEngine(compiledForeignSentence); _triggerAdRefresherIncrement(); }, icon: const Icon(Icons.volume_up, size: 18, color: Colors.black), label: const Text("HEAR AGAIN...", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: Colors.black, letterSpacing: 1.1))))),
                                const SizedBox(width: 12),
                                Expanded(child: Container(height: 54, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: _isSpeakingActive ? null : () async { if (mounted) { setState(() { isLoading = true; }); } await _triggerLazyCameraHardwareActivation(); if (mounted) { setState(() { isLoading = false; isFullSentencePhase = false; isRecordingPhase = true; _hasListenedToCurrentWord = false; }); _startRecordingCountdownSequence(); } }, child: const Text("YOUR TURN", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black, letterSpacing: 1.1))))),
                              ],
                            ),
                    ),
                    
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: _buildAdMobPlaceholderBannerUnit("BOTTOM SENTENCE BANNER AD"),
            ),
          ],
        ),
      ),
    );
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 20 OF 25
// CONTINUOUS LINE TELEPROMPTER GRAPHIC MATRIX
// ==========================================
  Widget _buildLiveStudioRecordingScreen() {
    final List<Map<String, dynamic>> countryGridMap = [
      {'name': 'Spanish', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)], 'flag': '🇪🇸'},
      {'name': 'French', 'colors': [const Color(0xFF0055A5), const Color(0xFFFFFFFF), const Color(0xFFEF4135)], 'flag': '🇫🇷'},
      {'name': 'German', 'colors': [const Color(0xFF000000), const Color(0xFFFF0000), const Color(0xFFFFCC00)], 'flag': '🇩🇪'},
      {'name': 'Italian', 'colors': [const Color(0xFF009246), const Color(0xFFFFFFFF), const Color(0xFFCE2B37)], 'flag': '🇮🇹'},
      {'name': 'Japanese', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFBC002D), const Color(0xFFFFFFFF)], 'flag': '🇯🇵'},
      {'name': 'Portuguese', 'colors': [const Color(0xFF006600), const Color(0xFFFF0000)], 'flag': '🇵🇹'},
      {'name': 'Dutch', 'colors': [const Color(0xFFAE1C28), const Color(0xFFFFFFFF), const Color(0xFF21468B)], 'flag': '🇳🇱'},
      {'name': 'Swedish', 'colors': [const Color(0xFF006AA7), const Color(0xFFFECC00)], 'flag': '🇸🇪'},
      {'name': 'Korean', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFCD2E3A), const Color(0xFF0047A0)], 'flag': '🇰🇷'},
    ];
    final Map<String, dynamic> activeLanguageData = countryGridMap.firstWhere((element) => element['name'] == widget.languageName, orElse: () => countryGridMap.first);
    final List<Color> activeFlagColors = activeLanguageData['colors'] as List<Color>;
    final String activeFlagIcon = activeLanguageData['flag'] as String? ?? '🏳️';
    
    final String cleanForeignText = compiledForeignSentence.replaceAll(RegExp(r'[\[\]\(\)\{\}、。，．]+'), '').toUpperCase().trim();
    final String cleanEnglishText = finalEnglishMeaning.replaceAll(RegExp(r'[\[\]\(\)\{\}]+'), '').toUpperCase().trim();

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), 
          child: Column(children: [
            Padding(padding: const EdgeInsets.only(bottom: 12), child: _buildStudioBrandingHeaderProfile(activeFlagIcon)),
            Expanded(
              child: Container(
                width: double.infinity, padding: const EdgeInsets.all(2), 
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.red.shade900.withOpacity(0.55), blurRadius: 16, spreadRadius: 2, offset: const Offset(0, 6))], gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight)), 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14), 
                  child: Stack(children: [
                    Positioned.fill(
                      child: (_cameraController == null || !_cameraController!.value.isInitialized) 
                          ? Container(color: const Color(0xFF0F0F12), child: const Center(child: CircularProgressIndicator(color: Colors.amber))) 
                          : AspectRatio(aspectRatio: _cameraController!.value.aspectRatio, child: CameraPreview(_cameraController!)),
                    ),
                    if (!isCountdownRunning)
                      Positioned(
                        left: 0, right: 0, top: 0, bottom: 0,
                        child: Center(
                          child: Container(
                            height: 64, width: double.infinity, padding: const EdgeInsets.symmetric(horizontal: 12), 
                            decoration: BoxDecoration(color: Colors.black.withOpacity(0.85)), 
                            child: SingleChildScrollView(
                              controller: _prompterScrollController, scrollDirection: Axis.horizontal, physics: const NeverScrollableScrollPhysics(), 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 240),
                                  Text(activeFlagIcon, style: const TextStyle(fontSize: 26)),
                                  const SizedBox(width: 48),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.8),
                                      children: [
                                        TextSpan(text: "$cleanForeignText    ", style: const TextStyle(color: Colors.white)),
                                        TextSpan(text: " ➔  ", style: TextStyle(color: Colors.amber.shade400)),
                                        TextSpan(text: "($cleanEnglishText)", style: TextStyle(color: Colors.amber.shade400)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 440),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (isCountdownRunning) Positioned.fill(child: Container(color: Colors.black.withOpacity(0.5), child: Center(child: Text("$productionCountdown", style: const TextStyle(color: Colors.amber, fontSize: 80, fontWeight: FontWeight.bold))))),
                  ]),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 54, width: double.infinity, 
              child: AnimatedOpacity(
                opacity: _isScrollFinished ? 1.0 : 0.0, duration: const Duration(milliseconds: 300), 
                child: IgnorePointer(
                  ignoring: !_isScrollFinished, 
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2.2), 
                      gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), 
                      boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]
                    ), 
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), 
                      onPressed: isCutButtonLocked ? null : _stopRecordingAndLaunchInterstitialVideoAd, 
                      child: const Text("CUT", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, color: Colors.black, letterSpacing: 1.2))
                    )
                  ),
                )
              )
            ),
            const SizedBox(height: 8),
          ]),
        ),
      ),
    );
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 21 OF 25
// STUDIO RECORDING SCREEN BRANDING HEADER
// ==========================================
  Widget _buildStudioBrandingHeaderProfile(String flagIcon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(flagIcon, style: const TextStyle(fontSize: 22)),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(children: [
              Text("WATCH YOUR", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
              const Text("WATCH YOUR", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white)),
            ]),
            Stack(children: [
              Text("LANGUAGE", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
              const Text("LANGUAGE", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white)),
            ]),
          ],
        ),
        const SizedBox(width: 12),
        Text(flagIcon, style: const TextStyle(fontSize: 22)),
      ],
    );
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 22 OF 25
// PRODUCTION COUNTDOWN TIMELINE CONTROLLER
// ==========================================
  void _startRecordingCountdownSequence() {
    if (!mounted) return;
    
    setState(() {
      productionCountdown = 3;
      isCountdownRunning = true;
      isCutButtonLocked = true;
      _isScrollFinished = false;
    });

    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      
      if (productionCountdown > 1) {
        setState(() { productionCountdown--; });
      } else {
        timer.cancel();
        setState(() { 
          isCountdownRunning = false; 
        });
        _startLiveStudioVideoCaptureStream();
      }
    });
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 23 OF 25
// HD 9:16 LIVE VIDEO PLAYBACK REVIEW SUITE
// ==========================================
  Widget _buildPostProductionReviewScreen() {
    final String cleanForeignText = compiledForeignSentence.replaceAll(RegExp(r'[\[\]\(\)\{\}、。，．]+'), '').toUpperCase().trim();
    final String cleanEnglishText = finalEnglishMeaning.replaceAll(RegExp(r'[\[\]\(\)\{\}]+'), '').toUpperCase().trim();

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 8, left: 16, right: 16), child: _buildAdMobPlaceholderBannerUnit("TOP REVIEW RESULTS BANNER AD")),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 260, height: 440,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFD4AF37), width: 2),
                          boxShadow: [BoxShadow(color: Colors.red.shade900.withOpacity(0.4), blurRadius: 16, spreadRadius: 1, offset: const Offset(0, 4))],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Stack(
                            children: [
                              // 🚀 REAL HD LOOPING VIDEO LAYER: Renders the player's actual recorded reaction footage fluidly
                              Positioned.fill(
                                child: (_reviewVideoController != null && _reviewVideoController!.value.isInitialized)
                                    ? AspectRatio(aspectRatio: _reviewVideoController!.value.aspectRatio, child: VideoPlayer(_reviewVideoController!))
                                    : Container(color: const Color(0xFF16161B), child: const Center(child: CircularProgressIndicator(color: Color(0xFFD4AF37)))),
                              ),
                              
                              Positioned(
                                top: 16, left: 0, right: 0,
                                child: Column(
                                  children: [
                                    Stack(alignment: Alignment.center, children: [
                                      Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.2..color = const Color(0xFFD4AF37))),
                                      const Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white)),
                                    ]),
                                    Stack(alignment: Alignment.center, children: [
                                      Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.2..color = const Color(0xFFD4AF37))),
                                      const Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white)),
                                    ]),
                                  ],
                                ),
                              ),
                              
                              Positioned(
                                bottom: 24, left: 12, right: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.8), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey.shade900, width: 1)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(cleanForeignText, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 0.5)),
                                      const SizedBox(height: 4),
                                      Text("➔ ($cleanEnglishText)", textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.amber.shade400, fontSize: 9, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text("SESSION COMPLETED!", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w900, letterSpacing: 1.5)),
                      const SizedBox(height: 6),
                      const Text("TAP A PLATFORM TOKEN BELOW TO PUBLISH YOUR COMP", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                      const SizedBox(height: 24),
                      _buildSocialPublishTokenLaneTiles(),
                      const SizedBox(height: 28),
                      _buildReviewDashboardActionControls(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16), child: _buildAdMobPlaceholderBannerUnit("BOTTOM REVIEW RESULTS BANNER AD")),
          ],
        ),
      ),
    );
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 24 OF 25
// TYPE-SAFE SOCIAL MEDIA GRID CANVAS
// ==========================================
  Widget _buildSocialPublishTokenLaneTiles() {
    final List<Map<String, dynamic>> socialPlatforms = [
      {'name': 'TikTok', 'icon': Icons.music_note, 'color': const Color(0xFF000000), 'border': const Color(0xFF00f2fe)},
      {'name': 'Reels', 'icon': Icons.video_library, 'color': const Color(0xFFE1306C), 'border': Colors.black},
      {'name': 'Shorts', 'icon': Icons.play_arrow, 'color': const Color(0xFFFF0000), 'border': Colors.black},
      {'name': 'WhatsApp', 'icon': Icons.chat, 'color': const Color(0xFF25D366), 'border': Colors.black},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: socialPlatforms.length,
      // 🎯 FIXED: Changed custom template text delegate to native Flutter Sliver Grid definitions
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2.1,
      ),
      itemBuilder: (context, index) {
        final platform = socialPlatforms[index];
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0F0F12),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: platform['border'] as Color, width: 1.5),
          ),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: platform['color'] as Color,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
            ),
            onPressed: () {},
            icon: Icon(platform['icon'] as IconData, size: 18),
            label: Text(
              (platform['name'] as String).toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 11, letterSpacing: 1.0),
            ),
          ),
        );
      },
    );
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 25 OF 25
// MASTER RECONSTRUCTION STATE CLASS CLOSURES
// ==========================================
  Widget _buildReviewDashboardActionControls() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade800, width: 2),
            ),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0F0F12), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              onPressed: () { Navigator.pop(context); },
              icon: const Icon(Icons.home, size: 18),
              label: const Text("HOME MENU", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 1.0)),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black, width: 2),
              gradient: const LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFFFFC107)]),
              boxShadow: [BoxShadow(color: Colors.amber.shade700.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 3))],
            ),
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              onPressed: () { _fetchCuratedGistJokesRepository(); },
              icon: const Icon(Icons.refresh, size: 18, color: Colors.black),
              label: const Text("NEXT ROUND", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13, letterSpacing: 1.0)),
            ),
          ),
        ),
      ],
    );
  }
} // 🎯 MASTER STATE CLOSURE: Snaps the entire script tree shut beautifully
