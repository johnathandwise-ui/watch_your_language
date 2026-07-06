// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 1 OF 22
// CORE SYSTEM IMPORTS & GLOBAL DATA CORE
// ==========================================
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } catch (e) {
    debugPrint("Hardware camera boot error: $e");
  }
  runApp(const WatchYourLanguageAppCanvas());
}
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 2 OF 22
// CORE THEME CONFIGURATION PROFILE CANVAS
// ==========================================
class WatchYourLanguageAppCanvas extends StatelessWidget {
  const WatchYourLanguageAppCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watch Your Language',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        primaryColor: Colors.amber,
      ),
      home: LanguageSelectorScreen(cameras: cameras),
    );
  }
}
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 3 OF 22
// BACK-BUTTON SAFETY WRAPPER & HOME DASHBOARD
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

    // 🎯 WillPopScope stops the browser from escaping to dead history tabs on older Flutter builds
    return WillPopScope(
      onWillPop: () async {
        return false; // Absolute navigation lockdown
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                Center(child: _buildBrandingHeaderProfile()),
                const SizedBox(height: 40),
                Expanded(child: _buildFlagSelectorGridLayout(context, languageGridList)),
              ],
            ),
          ),
        ),
      ),
    );
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 4 OF 22
// CENTER-ALIGNED CRIMSON DROP SHADOW LOGO
// ==========================================
  Widget _buildBrandingHeaderProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // 🎯 Centers text rows internally
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 2..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 3), blurRadius: 6, color: Colors.red.shade900)])),
            const Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, color: Colors.white)),
          ],
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 2..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 3), blurRadius: 6, color: Colors.red.shade900)])),
            const Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 44, fontWeight: FontWeight.w900, color: Colors.white)),
          ],
        ),
      ],
    );
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 5 OF 22
// FLUID HOME GRID INKWELL VIEW BUILDER
// ==========================================
  Widget _buildFlagSelectorGridLayout(BuildContext context, List<Map<String, dynamic>> gridMap) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 0.9,
      ),
      itemCount: gridMap.length,
      itemBuilder: (context, index) {
        final Map<String, dynamic> target = gridMap[index];
        final List<Color> flagColors = target['colors'] as List<Color>;
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => GameLoopScreen(cameras: cameras, languageName: target['name'] as String)));
          },
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.red.shade900.withOpacity(0.35), blurRadius: 10, spreadRadius: 1, offset: const Offset(0, 4))],
              gradient: LinearGradient(colors: flagColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Container(
              decoration: BoxDecoration(color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(target['flag'] as String, style: const TextStyle(fontSize: 32)),
                  const SizedBox(height: 8),
                  Text((target['name'] as String).toUpperCase(), maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 10, letterSpacing: 0.8)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 6 OF 22
// STATEFUL ENGINE ENTRY ROUTER WINDOW
// ==========================================
class GameLoopScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String languageName;

  const GameLoopScreen({super.key, required this.cameras, required this.languageName});
  @override
  State<GameLoopScreen> createState() => _GameLoopScreenState();
}
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 7 OF 22
// PHASE TIMELINE VARIABLES & STATE PROPERTIES
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
  bool _hasListenedToCurrentWord = false; // 🎯 Progressive reveal flag buys time for AdMob banners
  
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
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 8 OF 22
// ON-DEMAND CAMERA COLD INITIALIZATION MATRIX
// ==========================================
  void _bootstrapStudioHardware() async {
    // 🎯 Total Isolation: Zero camera background setup touches upon country tile entry
    _fetchCuratedGistJokesRepository();
  }

  Future<void> _triggerLazyCameraHardwareActivation() async {
    if (widget.cameras.isEmpty) {
      if (mounted) { setState(() { networkTrafficStatusHUD = "❌ NO CAMERAS FOUND"; }); }
      return;
    }
    
    // Safety check to prevent double-allocation initialization crashes
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
// 📦 WATCH YOUR LANGUAGE // BLOCK 9 OF 22
// LIVE UN-CACHED DIRECT DATA PIPELINE LOADER
// ==========================================
  void _fetchCuratedGistJokesRepository() async {
    // 🧼 RECONSTRUCTION PURGE SHIELD: Instantly flushes stale memory keys to kill thread lockups dead on room entry
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
// 📦 WATCH YOUR LANGUAGE // BLOCK 10 OF 22
// UN-CRASHABLE DEEP INDEX TRANSLATION PARSER
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
        
        // 🎯 UN-CRASHABLE PARSER: Walks down nested elements dynamically without brittle force-casting locks
        if (outerRawData is List && outerRawData.isNotEmpty) {
          final dynamic levelOne = outerRawData[0];
          if (levelOne is List && levelOne.isNotEmpty) {
            StringBuffer sentenceBuffer = StringBuffer();
            for (var segment in levelOne) {
              if (segment is List && segment.isNotEmpty) {
                final dynamic pureTextElement = segment[0];
                if (pureTextElement != null) {
                  sentenceBuffer.write(pureTextElement.toString() + " ");
                }
              }
            }
            if (sentenceBuffer.isNotEmpty) {
              translatedSentence = sentenceBuffer.toString().trim();
              parseSucceeded = true;
            }
          }
        }
      }
    } catch (_) {
      // Catch prevents background thread stalls
    }

    // 🛡️ UNBREAKABLE FALLBACK SHIELD: If network fails or parsing type-checks slip, use English and continue the game loop!
    if (!parseSucceeded || translatedSentence.isEmpty) {
      translatedSentence = englishSentence;
    }

    // Purify and prepare individual cards layout stream tracks safely
    List<String> parsedWordsList = [];
    if (widget.languageName == 'Japanese' || widget.languageName == 'Korean') {
      final String cleanAsianText = translatedSentence.replaceAll(RegExp(r'[^\p{L}\p{N}]+', unicode: true), '').trim();
      parsedWordsList = cleanAsianText.characters.map((String char) => char.trim()).where((String char) => char.isNotEmpty).toList();
    } else {
      final String cleanWesternText = translatedSentence.replaceAll(RegExp(r'[^\p{L}\p{N}\s]+', unicode: true), '').trim();
      parsedWordsList = cleanWesternText.split(" ").where((String w) => w.trim().isNotEmpty).toList();
    }

    // 🎯 CRITICAL STATE RECOVERY: Guarantees loading screens close under all operational conditions
    if (mounted) {
      setState(() {
        finalEnglishMeaning = englishSentence;
        compiledForeignSentence = translatedSentence;
        _currentFlashcardWord = parsedWordsList;
        currentWordIndex = 0;
        isLoading = false; // Opens the page view
        isRehearsalPhase = true;
      });
      _startCueCardCacheImpressionTimer();
    }
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 11 OF 22
// SILENT CUE CARD ENTRANCE & AD IMPRESSION BUFFERS
// ==========================================
  void _startCueCardCacheImpressionTimer() {
    if (!mounted) return;
    
    // 🎯 Enforce total silence upon landing on a card. Audio only fires when user taps "LISTEN".
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
// 📦 WATCH YOUR LANGUAGE // BLOCK 12 OF 22
// ROUTER STEPS WITH RE-SETTABLE LISTEN TRACKERS
// ==========================================
  void _advanceWordIndexTrackerOrRouteNext() {
    if (!mounted) return;
    
    setState(() { 
      _isSpeakingActive = true;
      _hasListenedToCurrentWord = false; // 🎯 Reset flag guarantees the next card starts with "LISTEN"
    });
    
    if (currentWordIndex < _currentFlashcardWord.length - 1) {
      setState(() { currentWordIndex++; });
      _startCueCardCacheImpressionTimer();
    } else {
      setState(() { isRehearsalPhase = false; isFullSentencePhase = true; });
    }
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 13 OF 22
// TTS HARDWARE LISTENERS & ENFORCED AD REFRESHERS
// ==========================================
  void _executeVoicePronunciationEngine(String textToSpeak) async {
    if (textToSpeak.isEmpty || textToSpeak == "LOADING...") return;
    String ttsLocaleCode = "es-ES";
    switch (widget.languageName) {
      case 'Spanish': ttsLocaleCode = "es-ES"; break;
      case 'French': ttsLocaleCode = "fr-FR"; break;
      case 'German': ttsLocaleCode = "de-DE"; break;
      case 'Italian': ttsLocaleCode = "it-IT"; break;
      case 'Japanese': ttsLocaleCode = "ja-JP"; break;
      case 'Portuguese': ttsLocaleCode = "pt-PT"; break;
      case 'Dutch': ttsLocaleCode = "nl-NL"; break;
      case 'Swedish': ttsLocaleCode = "sv-SE"; break;
      case 'Korean': ttsLocaleCode = "ko-KR"; break;
    }
    
    // 🎧 Active core synchronization keeps the interaction channel closed
    if (mounted) { setState(() { _isSpeakingActive = true; }); }
    
    _flutterTts.setStartHandler(() {
      if (mounted) { setState(() { _isSpeakingActive = true; }); }
    });
    
    _flutterTts.setCompletionHandler(() {
      if (mounted) { 
        setState(() { 
          _isSpeakingActive = false; 
        }); 
        // ⚡ Force ad refresher layout engine incremental updates on word complete
        _triggerAdRefresherIncrement(); 
      }
    });
    
    _flutterTts.setErrorHandler((msg) {
      if (mounted) { setState(() { _isSpeakingActive = false; }); }
    });

    await _flutterTts.setLanguage(ttsLocaleCode);
    await _flutterTts.setSpeechRate(0.42);
    await _flutterTts.speak(textToSpeak);
  }

  void _triggerAdRefresherIncrement() {
    if (mounted) { setState(() { adRefreshCounterSeed++; }); }
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 14 OF 22
// LIVE STUDIO RECORDING TIMELINE SEQUENCE
// ==========================================
  void _startRecordingCountdownSequence() {
    if (!mounted) return;
    setState(() { isCountdownRunning = true; productionCountdown = 3; _isScrollFinished = false; });
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!mounted) { timer.cancel(); return; }
      if (productionCountdown > 1) {
        setState(() { productionCountdown--; });
      } else {
        timer.cancel();
        setState(() { isCountdownRunning = false; isCutButtonLocked = true; });
        _startLiveStudioVideoCaptureStream();
      }
    });
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 15 OF 22
// CONTINUOUS LINE TELEPROMPTER TIMELINES
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
        
        // 🎯 Steady Pacing Velocity: Locked into a perfectly balanced 12 seconds loop timeline
        _prompterScrollController!.animateTo(maxScrollExtent, duration: const Duration(seconds: 12), curve: Curves.linear).then((_) {
          if (mounted) { setState(() { _isScrollFinished = true; }); }
        });
      }
    });
  }

  void _stopRecordingAndLaunchInterstitialVideoAd() async {
    if (_cameraController == null || !_cameraController!.value.isRecordingVideo) return;
    try {
      await _cameraController!.stopVideoRecording();
      
      // 🎯 HARD CAM STOP SWITCH: Instantly purges and disposes camera lens streams to clear device memory caches
      _cameraController?.dispose();
      _cameraController = null;
      
      if (mounted) { setState(() { isLoading = true; isRecordingPhase = false; }); }
      
      Timer(const Duration(milliseconds: 2000), () {
        if (mounted) { setState(() { isLoading = false; isPlaybackReviewPhase = true; }); }
      });
    } catch (_) {}
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 16 OF 22
// MASTER UI SCREEN ROUTER STATE MACHINE SWITCHER
// ==========================================
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black, 
        body: Center(child: CircularProgressIndicator(color: Colors.amber)),
      );
    }
    if (isRehearsalPhase) return _buildWordByWordRehearsalScreen();
    if (isFullSentencePhase) return _buildFullSentencePresentationScreen();
    if (isRecordingPhase) return _buildLiveStudioRecordingScreen();
    if (isPlaybackReviewPhase) return _buildPostAdPlaybackReviewScreen();
    return const Scaffold(backgroundColor: Colors.black);
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 17 OF 22
// REHEARSAL SCREEN CONTAINER WRAPPER
// ==========================================
  Widget _buildWordByWordRehearsalScreen() {
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
    final String activeCueWord = _currentFlashcardWord.isNotEmpty ? _currentFlashcardWord[currentWordIndex] : "LOADING...";

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 8, left: 16, right: 16), child: _buildAdMobPlaceholderBannerUnit("TOP REHEARSAL BANNER AD")),
            Expanded(child: Center(child: SingleChildScrollView(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), child: _buildCenterCueCardBlock(activeFlagColors, activeCueWord, activeFlagIcon)))),
            Padding(padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16), child: _buildAdMobPlaceholderBannerUnit("BOTTOM REHEARSAL BANNER AD")),
          ],
        ),
      ),
    );
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 18 OF 22
// FLEXIBLE RESPONSIVE DECK & BALANCED SPACERS
// ==========================================
  Widget _buildCenterCueCardBlock(List<Color> activeFlagColors, String activeCueWord, String flagIcon) {
    final bool isInteractionProhibited = _isDelayActive || _isSpeakingActive;

    return Container(
      // Constrain the block to the full height available between the top and bottom banners
      constraints: const BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 🎯 SPACER 1: Pushes the header away from the very top of the safe area bounds
          const Spacer(flex: 2),

          GestureDetector(
            onTap: () { Navigator.pop(context); },
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(flagIcon, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Stack(alignment: Alignment.center, children: [
                      Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
                      const Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white)),
                    ]),
                    Stack(alignment: Alignment.center, children: [
                      Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
                      const Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white)),
                    ]),
                    const SizedBox(height: 4),
                    Text(widget.languageName.toUpperCase(), style: const TextStyle(color: Color.fromARGB(255, 235, 204, 5), fontSize: 13, fontWeight: FontWeight.w900, letterSpacing: 2.5)),
                  ],
                ),
                const SizedBox(width: 12),
                Text(flagIcon, style: const TextStyle(fontSize: 24)),
              ],
            ),
          ),

          // 🎯 SPACER 2: Spreads the space between the logo header and the instructions prompt
          const Spacer(flex: 3),
          const Text("SAY THIS WORD:", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 12),
          
          // 🎯 MASSIVE CUE CARD VIEWPORT CONTAINER
          Container(
            width: double.infinity, 
            padding: const EdgeInsets.symmetric(vertical: 48),
            decoration: BoxDecoration(color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey.shade900, width: 2), boxShadow: [BoxShadow(color: Colors.red.shade900.withOpacity(0.35), blurRadius: 16, spreadRadius: 1, offset: const Offset(0, 4))]),
            child: _isDelayActive 
                ? const Center(child: SizedBox(width: 32, height: 32, child: CircularProgressIndicator(color: Color(0xFFD4AF37), strokeWidth: 3)))
                : Stack(alignment: Alignment.center, children: [
                    Text(activeCueWord.toUpperCase(), textAlign: TextAlign.center, style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900, fontFamily: 'Arial', letterSpacing: 0.5, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 4), blurRadius: 10, color: Colors.red.shade900.withOpacity(0.85))])),
                    Text(activeCueWord.toUpperCase(), textAlign: TextAlign.center, style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w900, fontFamily: 'Arial', letterSpacing: 0.5, color: Colors.white)),
                  ]),
          ),
          const SizedBox(height: 10),
          Text("WORD ${currentWordIndex + 1} OF ${_currentFlashcardWord.length}", style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.bold)),

          // 🎯 SPACER 3: Dynamic distribution spring balances the control buttons safely down towards the fold fold
          const Spacer(flex: 4),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: !_hasListenedToCurrentWord
                ? Container(
                    key: const ValueKey('listen_primary_only'),
                    height: 54, width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      onPressed: _isDelayActive ? null : () { 
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
                      Expanded(child: Container(height: 54, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: isInteractionProhibited ? null : () { _advanceWordIndexTrackerOrRouteNext(); }, child: const Text("NEXT", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black, letterSpacing: 1.1))))),
                    ],
                  ),
          ),
          
          // 🎯 SPACER 4: Micro cushioning layer anchors the final button row elegantly directly above the bottom banner
          const Spacer(flex: 1),
        ],
      ),
    );
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 19 OF 22
// HOME-ROUTE FULL SENTENCE INTERFACE VIEW
// ==========================================
  Widget _buildFullSentencePresentationScreen() {
    final List<Map<String, dynamic>> countryGridMap = [{'name': 'Spanish', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)], 'flag': '🇪🇸'}, {'name': 'French', 'colors': [const Color(0xFF0055A5), const Color(0xFFFFFFFF), const Color(0xFFEF4135)], 'flag': '🇫🇷'}, {'name': 'German', 'colors': [const Color(0xFF000000), const Color(0xFFFF0000), const Color(0xFFFFCC00)], 'flag': '🇩🇪'}, {'name': 'Italian', 'colors': [const Color(0xFF009246), const Color(0xFFFFFFFF), const Color(0xFFCE2B37)], 'flag': '🇮🇹'}, {'name': 'Japanese', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFBC002D), const Color(0xFFFFFFFF)], 'flag': '🇯🇵'}, {'name': 'Portuguese', 'colors': [const Color(0xFF006600), const Color(0xFFFF0000)], 'flag': '🇵🇹'}, {'name': 'Dutch', 'colors': [const Color(0xFFAE1C28), const Color(0xFFFFFFFF), const Color(0xFF21468B)], 'flag': '🇳🇱'}, {'name': 'Swedish', 'colors': [const Color(0xFF006AA7), const Color(0xFFFECC00)], 'flag': '🇸🇪'}, {'name': 'Korean', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFCD2E3A), const Color(0xFF0047A0)], 'flag': '🇰🇷'}];
    final Map<String, dynamic> activeLanguageData = countryGridMap.firstWhere((element) => element['name'] == widget.languageName, orElse: () => countryGridMap.first);
    final List<Color> activeFlagColors = activeLanguageData['colors'] as List<Color>;
    final String activeFlagIcon = activeLanguageData['flag'] as String? ?? '🏳️';
    
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      if (mounted && isFullSentencePhase && currentWordIndex != -999) { 
        currentWordIndex = -999; 
        Future.delayed(const Duration(milliseconds: 350), () {
          if (mounted && isFullSentencePhase) {
            _executeVoicePronunciationEngine(compiledForeignSentence);
          }
        });
      } 
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 8, left: 16, right: 16), child: _buildAdMobPlaceholderBannerUnit("TOP SENTENCE BANNER AD")),
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () { Navigator.pop(context); },
                        behavior: HitTestBehavior.opaque,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(activeFlagIcon, style: const TextStyle(fontSize: 24)),
                            const SizedBox(width: 12),
                            Column(children: [
                              Stack(alignment: Alignment.center, children: [
                                Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
                                const Text("WATCH YOUR", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white)),
                              ]),
                              Stack(alignment: Alignment.center, children: [
                                Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 1.5..color = const Color(0xFFD4AF37), shadows: [Shadow(offset: const Offset(0, 2), blurRadius: 4, color: Colors.red.shade900)])),
                                const Text("LANGUAGE", textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: Colors.white)),
                              ]),
                            ]),
                            const SizedBox(width: 12),
                            Text(activeFlagIcon, style: const TextStyle(fontSize: 24)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text("THE FULL CHALLENGE SENTENCE:", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                      const SizedBox(height: 16),
                      Container(width: double.infinity, padding: const EdgeInsets.all(2), decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.red.shade900.withOpacity(0.55), blurRadius: 16, spreadRadius: 2, offset: const Offset(0, 6))], gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight)), child: Container(width: double.infinity, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56), decoration: BoxDecoration(color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(14)), child: Text(compiledForeignSentence, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)))),
                      const SizedBox(height: 48),
                      Row(children: [
                        Expanded(child: Container(height: 54, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]), child: ElevatedButton.icon(style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), onPressed: () { _executeVoicePronunciationEngine(compiledForeignSentence); _triggerAdRefresherIncrement(); }, icon: const Icon(Icons.volume_up, size: 18, color: Colors.black), label: const Text("HEAR AGAIN...", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: Colors.black, letterSpacing: 1.1))))),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            height: 54,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.black, width: 2), gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.4), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 2))]),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                              onPressed: _isSpeakingActive ? null : () async { 
                                // 🎯 STRICT SYNCHRONIZATION: Explicitly awaits camera driver completion before shifting states
                                if (mounted) { setState(() { isLoading = true; }); }
                                await _triggerLazyCameraHardwareActivation();
                                if (mounted) {
                                  setState(() { 
                                    isLoading = false;
                                    isFullSentencePhase = false; 
                                    isRecordingPhase = true; 
                                  }); 
                                  _startRecordingCountdownSequence(); 
                                }
                              },
                              child: const Text("YOUR TURN", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black, letterSpacing: 1.1)),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16), child: _buildAdMobPlaceholderBannerUnit("BOTTOM SENTENCE BANNER AD")),
          ],
        ),
      ),
    );
  }

// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 20 OF 22
// CONTINUOUS RICH-TEXT SINGLE PROMPTER CANVAS
// ==========================================
  Widget _buildLiveStudioRecordingScreen() {
    final List<Map<String, dynamic>> countryGridMap = [{'name': 'Spanish', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)], 'flag': '🇪🇸'}, {'name': 'French', 'colors': [const Color(0xFF0055A5), const Color(0xFFFFFFFF), const Color(0xFFEF4135)], 'flag': '🇫🇷'}, {'name': 'German', 'colors': [const Color(0xFF000000), const Color(0xFFFF0000), const Color(0xFFFFCC00)], 'flag': '🇩🇪'}, {'name': 'Italian', 'colors': [const Color(0xFF009246), const Color(0xFFFFFFFF), const Color(0xFFCE2B37)], 'flag': '🇮🇹'}, {'name': 'Japanese', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFBC002D), const Color(0xFFFFFFFF)], 'flag': '🇯🇵'}, {'name': 'Portuguese', 'colors': [const Color(0xFF006600), const Color(0xFFFF0000)], 'flag': '🇵🇹'}, {'name': 'Dutch', 'colors': [const Color(0xFFAE1C28), const Color(0xFFFFFFFF), const Color(0xFF21468B)], 'flag': '🇳🇱'}, {'name': 'Swedish', 'colors': [const Color(0xFF006AA7), const Color(0xFFFECC00)], 'flag': '🇸🇪'}, {'name': 'Korean', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFCD2E3A), const Color(0xFF0047A0)], 'flag': '🇰🇷'}];
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
                    // 🎯 HARD TYPE-SAFETY GUARD: Checking against null explicitly checks initialization status to prevent page selection freezing entirely
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
                      borderRadius: BorderRadius.circular(12), 
                      border: Border.all(color: Colors.black, width: 2.2), 
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
// 📦 WATCH YOUR LANGUAGE // BLOCK 21 OF 22
// PREMIUM PLAYBACK REVIEW SUITE & MEDIA LANES
// ==========================================
  Widget _buildPostAdPlaybackReviewScreen() {
    final List<Map<String, dynamic>> countryGridMap = [{'name': 'Spanish', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)], 'flag': '🇪🇸'}, {'name': 'French', 'colors': [const Color(0xFF0055A5), const Color(0xFFFFFFFF), const Color(0xFFEF4135)], 'flag': '🇫🇷'}, {'name': 'German', 'colors': [const Color(0xFF000000), const Color(0xFFFF0000), const Color(0xFFFFCC00)], 'flag': '🇩🇪'}, {'name': 'Italian', 'colors': [const Color(0xFF009246), const Color(0xFFFFFFFF), const Color(0xFFCE2B37)], 'flag': '🇮🇹'}, {'name': 'Japanese', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFBC002D), const Color(0xFFFFFFFF)], 'flag': '🇯🇵'}, {'name': 'Portuguese', 'colors': [const Color(0xFF006600), const Color(0xFFFF0000)], 'flag': '🇵🇹'}, {'name': 'Dutch', 'colors': [const Color(0xFFAE1C28), const Color(0xFFFFFFFF), const Color(0xFF21468B)], 'flag': '🇳🇱'}, {'name': 'Swedish', 'colors': [const Color(0xFF006AA7), const Color(0xFFFECC00)], 'flag': '🇸🇪'}, {'name': 'Korean', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFCD2E3A), const Color(0xFF0047A0)], 'flag': '🇰🇷'}];
    final Map<String, dynamic> activeLanguageData = countryGridMap.firstWhere((element) => element['name'] == widget.languageName, orElse: () => countryGridMap.first);
    final List<Color> activeFlagColors = activeLanguageData['colors'] as List<Color>;
    final String activeFlagIcon = activeLanguageData['flag'] as String? ?? '🏳️';

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Column(children: [
          Padding(padding: const EdgeInsets.only(top: 8, left: 16, right: 16), child: _buildAdMobPlaceholderBannerUnit("TOP REVIEW INTERSTITIAL BANNER AD")),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(children: [
                _buildStudioBrandingHeaderProfile(activeFlagIcon),
                const SizedBox(height: 16),
                Container(
                  height: 220, width: double.infinity, padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.red.shade900.withOpacity(0.45), blurRadius: 12, spreadRadius: 1, offset: const Offset(0, 4))], gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight)),
                  child: Container(
                    decoration: BoxDecoration(color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(14)),
                    child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.play_circle_outline, color: Colors.amber, size: 52), SizedBox(height: 8), Text("READY TO CHOP PRODUCER...", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.8))])),
                  ),
                ),
                const SizedBox(height: 16),
                const Text("PUBLISH RUSH LANES:", style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                const SizedBox(height: 12),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  _buildSocialPublishTokenButton("🎬", "TIKTOK", const Color(0xFF000000)),
                  _buildSocialPublishTokenButton("🔴", "YOUTUBE", const Color(0xFFFF0000)),
                  _buildSocialPublishTokenButton("📸", "INSTA", const Color(0xFFE1306C)),
                  _buildSocialPublishTokenButton("🔵", "FB", const Color(0xFF1877F2)),
                ]),
                const SizedBox(height: 24),
                _buildReviewControlActionButton("TRY AGAIN", activeFlagColors, () { setState(() { isPlaybackReviewPhase = false; isRecordingPhase = true; }); _startRecordingCountdownSequence(); }),
                const SizedBox(height: 10),
                _buildReviewControlActionButton("TRY ANOTHER LANGUAGE", activeFlagColors, () { Navigator.pop(context); }),
                const SizedBox(height: 10),
                _buildReviewControlActionButton("NEXT LINE", activeFlagColors, () { _fetchCuratedGistJokesRepository(); }),
              ]),
            ),
          ),
          Padding(padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16), child: _buildAdMobPlaceholderBannerUnit("BOTTOM REVIEW INTERSTITIAL BANNER AD")),
        ]),
      ),
    );
  }
// ==========================================
// 📦 WATCH YOUR LANGUAGE // BLOCK 22 OF 22
// REVIEW SUB-COMPONENTS & CORE STATE PURGE
// ==========================================
  Widget _buildSocialPublishTokenButton(String emoji, String title, Color backingColor) {
    return Container(
      width: 56, height: 56,
      decoration: BoxDecoration(
        color: backingColor.withOpacity(0.2), 
        borderRadius: BorderRadius.circular(12), 
        border: Border.all(color: backingColor, width: 2), 
        boxShadow: [BoxShadow(color: backingColor.withOpacity(0.15), blurRadius: 6)]
      ),
      child: Center(child: Text(emoji, style: const TextStyle(fontSize: 22))),
    );
  }

  Widget _buildReviewControlActionButton(String label, List<Color> activeFlagColors, VoidCallback onTapAction) {
    return Container(
      height: 50, width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), 
        border: Border.all(color: Colors.black, width: 2), 
        gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight), 
        boxShadow: [BoxShadow(color: Colors.white.withOpacity(0.35), blurRadius: 10, spreadRadius: 1, offset: const Offset(0, 2))]
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        onPressed: onTapAction,
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: Colors.black, letterSpacing: 1.2)),
      ),
    );
  }

  Widget _buildAdMobPlaceholderBannerUnit(String label) {
    return Container(
      height: 50, width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey.shade900, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade800)),
      child: Center(child: Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold))),
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _prompterScrollController?.dispose();
    _cameraController?.dispose();
    super.dispose();
  }
}
