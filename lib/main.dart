// ============================================================================
// WATCH YOUR LANGUAGE // PART 1 OF 5: BASE INITIALIZATION & THE 3X3 GRID
// ============================================================================
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'dart:async';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final List<CameraDescription> cameras = await availableCameras();
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: LanguageSelectorScreen(cameras: cameras),
  ));
}

class LanguageSelectorScreen extends StatelessWidget {
  final List<CameraDescription> cameras;
  const LanguageSelectorScreen({super.key, required this.cameras});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> countryGridMap = [
      {'name': 'Spanish', 'flag': '🇪🇸', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)]},
      {'name': 'French', 'flag': '🇫🇷', 'colors': [const Color(0xFF0055A5), const Color(0xFFFFFFFF), const Color(0xFFEF4135)]},
      {'name': 'German', 'flag': '🇩🇪', 'colors': [const Color(0xFF000000), const Color(0xFFFF0000), const Color(0xFFFFCC00)]},
      {'name': 'Italian', 'flag': '🇮🇹', 'colors': [const Color(0xFF009246), const Color(0xFFFFFFFF), const Color(0xFFCE2B37)]},
      {'name': 'Japanese', 'flag': '🇯🇵', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFBC002D), const Color(0xFFFFFFFF)]},
      {'name': 'Portuguese', 'flag': '🇵🇹', 'colors': [const Color(0xFF006600), const Color(0xFFFF0000)]},
      {'name': 'Dutch', 'flag': '🇳🇱', 'colors': [const Color(0xFFAE1C28), const Color(0xFFFFFFFF), const Color(0xFF21468B)]},
      {'name': 'Swedish', 'flag': '🇸🇪', 'colors': [const Color(0xFF006AA7), const Color(0xFFFECC00)]},
      {'name': 'Korean', 'flag': '🇰🇷', 'colors': [const Color(0xFFFFFFFF), const Color(0xFFCD2E3A), const Color(0xFF0047A0)]},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0F0F12), Color(0xFF050507)],
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.03,
                  child: GridPaper(color: Colors.white, interval: 24, subdivisions: 1, child: Container()),
                ),
              ),
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    _buildMetallicLogoHeaderUnit(),
                    const SizedBox(height: 36),
                    const Text(
                      "SELECT A LANGUAGE TO READ:",
                      style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                    ),
                    const SizedBox(height: 16),
                    _buildFlagSelectorGridLayout(context, countryGridMap),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
   // ============================================================================
  // WATCH YOUR LANGUAGE // PART 2 OF 5: OUTLINED LOGO & SHADOW GRID BUILDERS
  // ============================================================================
  Widget _buildMetallicLogoHeaderUnit() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Layer 1: "Watch-Your" with a tight 1.5pt metallic gold stroke and a rich crimson shadow
        Stack(
          alignment: Alignment.center,
          children: [
            // Underlying Gold Stroke Rim Layer
            Text(
              "Watch-Your",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w900,
                fontFamily: 'Arial',
                letterSpacing: -0.5,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1.5 // Sharp outline thickness prevents letter clogging
                  ..color = const Color(0xFFD4AF37), // Metallic gold signature tone
                shadows: [
                  Shadow(offset: const Offset(0, 5), blurRadius: 15, color: Colors.red.shade900.withOpacity(0.95)),
                ],
              ),
            ),
            // Floating Pure White Inner Text Face Layer
            const Text(
              "Watch-Your",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w900,
                fontFamily: 'Arial',
                letterSpacing: -0.5,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        // Layer 2: "Language" with matching balanced border spacing parameters
        Stack(
          alignment: Alignment.center,
          children: [
            // Underlying Gold Stroke Rim Layer
            Text(
              "Language",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                fontFamily: 'Arial',
                letterSpacing: -0.5,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 1.5
                  ..color = const Color(0xFFD4AF37),
                shadows: [
                  Shadow(offset: const Offset(0, 5), blurRadius: 15, color: Colors.red.shade900.withOpacity(0.95)),
                ],
              ),
            ),
            // Floating Pure White Inner Text Face Layer
            const Text(
              "Language",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                fontFamily: 'Arial',
                letterSpacing: -0.5,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFlagSelectorGridLayout(BuildContext context, List<Map<String, dynamic>> gridMap) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, 
        crossAxisSpacing: 12, 
        mainAxisSpacing: 12, 
        childAspectRatio: 0.9,
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
              boxShadow: [
                BoxShadow(
                  color: Colors.red.shade900.withOpacity(0.35),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
              gradient: LinearGradient(colors: flagColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Container(
              decoration: BoxDecoration(color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(target['flag'] as String, style: const TextStyle(fontSize: 32)),
                  const SizedBox(height: 8),
                  Text(
                    (target['name'] as String).toUpperCase(), 
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 10, letterSpacing: 0.8),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
// ============================================================================
// WATCH YOUR LANGUAGE // PART 3 OF 5: GAME STATE MACHINE & HARDWARE ENGINE
// ============================================================================
class GameLoopScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  final String languageName;

  const GameLoopScreen({super.key, required this.cameras, required this.languageName});
  @override
  State<GameLoopScreen> createState() => _GameLoopScreenState();
}

class _GameLoopScreenState extends State<GameLoopScreen> {
  CameraController? _cameraController;
  final FlutterTts _flutterTts = FlutterTts();
  
  bool isLoading = true;
  bool isRehearsalPhase = false;
  bool isFullSentencePhase = false;
  bool isRecordingPhase = false;
  bool isPlaybackReviewPhase = false;
  bool _isDelayActive = false; // Manages the 1.2-second ad visibility window layer
  
  String finalEnglishMeaning = "";
  String compiledForeignSentence = "";
  List<String> _currentFlashcardWord = [];
  int currentWordIndex = 0;
  
  int productionCountdown = 3;
  bool isCountdownRunning = false;
  bool isCutButtonLocked = false;
  int adRefreshCounterSeed = 0;
  
  String networkTrafficStatusHUD = "📡 INITIALISING ENGINE MATRIX...";
  
  Timer? _countdownTimer;
  ScrollController? _prompterScrollController;

  @override
  void initState() {
    super.initState();
    _prompterScrollController = ScrollController();
    _bootstrapStudioHardware();
  }

  void _bootstrapStudioHardware() async {
    if (widget.cameras.isEmpty) {
      if (mounted) {
        setState(() { networkTrafficStatusHUD = "❌ NO CAMERAS FOUND"; });
      }
      return;
    }
    final CameraDescription frontCam = widget.cameras.firstWhere(
      (CameraDescription c) => c.lensDirection == CameraLensDirection.front,
      orElse: () => widget.cameras.first,
    );
    _cameraController = CameraController(frontCam, ResolutionPreset.medium, enableAudio: true);
    try {
      await _cameraController!.initialize();
      _generateAutomatedComedyScript();
    } catch (e) {
      if (mounted) {
        setState(() { networkTrafficStatusHUD = "❌ CAMERA ERROR: $e"; });
      }
    }
  }

  void _startCueCardCacheImpressionTimer() {
    if (!mounted) return;
    setState(() { _isDelayActive = true; });
    Timer(const Duration(milliseconds: 1200), () {
      if (mounted) { 
        setState(() { _isDelayActive = false; }); 
        
        // Robust Audio Fallback Trigger: Fetches and forcefully fires target pronunciation
        final String activeCueWord = _currentFlashcardWord.isNotEmpty 
            ? _currentFlashcardWord[currentWordIndex] 
            : "";
            
        if (activeCueWord.isNotEmpty && activeCueWord != "LOADING...") {
          // Wrap in a short future microtask track to ensure web browser audio thread context is active
          Future.microtask(() => _executeVoicePronunciationEngine(activeCueWord));
        }
      }
    });
  }

     void _advanceWordIndexTrackerOrRouteNext() {
    if (!mounted) return;
    if (currentWordIndex < _currentFlashcardWord.length - 1) {
      setState(() { currentWordIndex++; });
      _startCueCardCacheImpressionTimer(); // Trigger impression buffer delay for next card
    } else {
      setState(() { isRehearsalPhase = false; isFullSentencePhase = true; });
      
      // 🛡️ State-Safe Delayed Hook: Pushes the audio call safely past Flutter's layout paint cycles
      Timer(const Duration(milliseconds: 600), () {
        if (mounted && isFullSentencePhase) {
          _executeVoicePronunciationEngine(compiledForeignSentence);
        }
      });
    }
  }

// ============================================================================
// WATCH YOUR LANGUAGE // PART 4 OF 5: NETWORKING PROTECTION & LOCAL AUTOMATION
// ============================================================================
  void _generateAutomatedComedyScript() async {
    if (mounted) {
      setState(() {
        isLoading = true;
        isRehearsalPhase = false;
        isFullSentencePhase = false;
        isRecordingPhase = false;
        isPlaybackReviewPhase = false;
      });
    }
    
    const String urlProtocol = "https://";
    const String urlServiceIdentifier = "generate-script-";
    const String urlUniqueTokenHash = "t3yutwgarq-uc";
    const String urlServerDomainPath = ".a.run.app";
    const String fullAssembledProxyUrl = "$urlProtocol$urlServiceIdentifier$urlUniqueTokenHash$urlServerDomainPath";
    
    try {
      final http.Response response = await http.post(
        Uri.parse(fullAssembledProxyUrl),
        headers: {"Content-Type": "application/json", "Accept": "application/json"},
        body: json.encode({"language": widget.languageName}),
      ).timeout(const Duration(seconds: 12));

      if (response.statusCode == 200) {
        final Map<String, dynamic> outerJsonBox = json.decode(response.body);
        final String rawTextPayload = outerJsonBox['payload']?.toString().trim() ?? "";
        
        if (rawTextPayload.contains("--")) {
          final List<String> segments = rawTextPayload.split("--");
          final String finalForeign = segments[0].trim().replaceAll('"', '');
          final String finalEnglish = segments[1].trim().replaceAll('"', '');

          if (finalEnglish.isNotEmpty && finalForeign.isNotEmpty) {
            final List<String> computedWords = finalForeign.split(" ").where((String w) {
              return w.trim().isNotEmpty;
            }).toList();
            
            if (mounted) {
              setState(() {
                finalEnglishMeaning = finalEnglish;
                compiledForeignSentence = finalForeign;
                currentWordIndex = 0;
                _currentFlashcardWord = computedWords;
                isLoading = false;
                isRehearsalPhase = true;
              });
              _startCueCardCacheImpressionTimer(); // Start the 1.2s ad view delay
            }
            return;
          }
        }
      }
    } catch (_) {}
    _executeLocalBackupComedyMatrix();
  }

  void _executeLocalBackupComedyMatrix() {
    final Random rand = Random();
    final List<Map<String, String>> localBackupVault = [
      {
        "foreign": "Por favor, ignore mi correo anterior porque mi jefe es un completo tirano insoportable",
        "english": "Please completely ignore my previous email because my manager is a massive micromanaging dictator"
      },
      {
        "foreign": "Gracias por su amable sugerencia pero voy a ignorar absolutamente todo lo que acaba de decir",
        "english": "Thank you for your lovely feedback but I am actively going to ignore your entire opinion"
      },
      {
        "foreign": "Vamos a reunirnos la próxima semana para hablar de cosas que no nos importan a ninguno",
        "english": "Let us connect next week to discuss mind-numbing parameters that neither of us actually care about"
      }
    ];
    
    final Map<String, String> chosenPair = localBackupVault[rand.nextInt(localBackupVault.length)];
    final List<String> computedWords = chosenPair["foreign"]!.split(" ").where((String w) {
      return w.trim().isNotEmpty;
    }).toList();
    
    if (mounted) {
      setState(() {
        compiledForeignSentence = chosenPair["foreign"]!;
        finalEnglishMeaning = chosenPair["english"]!;
        _currentFlashcardWord = computedWords;
        currentWordIndex = 0;
        isLoading = false;
        isRehearsalPhase = true;
      });
      _startCueCardCacheImpressionTimer();
    }
  }

  void _triggerAdRefresherIncrement() {
    if (mounted) {
      setState(() {
        adRefreshCounterSeed++;
      });
    }
  }
// ============================================================================
// WATCH YOUR LANGUAGE // PART 5 (A) - SPLIT 1: MASTER REHEARSAL ROUTER
// ============================================================================
  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator(color: Colors.amber)),
      );
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
      return _buildPostAdPlaybackReviewScreen();
    }
    return const Scaffold(backgroundColor: Colors.black);
  }

  Widget _buildWordByWordRehearsalScreen() {
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

    final Map<String, dynamic> activeLanguageData = countryGridMap.firstWhere(
      (element) => element['name'] == widget.languageName,
      orElse: () => {'name': 'Spanish', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)]},
    );
    final List<Color> activeFlagColors = activeLanguageData['colors'] as List<Color>;

    final String activeCueWord = _currentFlashcardWord.isNotEmpty 
        ? _currentFlashcardWord[currentWordIndex] 
        : "LOADING...";

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: _buildAdMobPlaceholderBannerUnit("TOP REHEARSAL BANNER AD"),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: _buildCenterCueCardBlock(activeFlagColors, activeCueWord),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                  child: _buildAdMobPlaceholderBannerUnit("BOTTOM REHEARSAL BANNER AD"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
// ============================================================================
// WATCH YOUR LANGUAGE // PART 5 (A) - SPLIT 2: GIANT FLASHCARD & CONTRAST BUTTONS
// ============================================================================
  Widget _buildCenterCueCardBlock(List<Color> activeFlagColors, String activeCueWord) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "SAY THIS WORD:",
          style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.red.shade900.withOpacity(0.55),
                blurRadius: 16,
                spreadRadius: 2,
                offset: const Offset(0, 6),
              ),
            ],
            gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 140), // 140 vertical padding expands the box drastically
            decoration: BoxDecoration(color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(14)),
            child: _isDelayActive 
                ? const Center(child: SizedBox(width: 32, height: 32, child: CircularProgressIndicator(color: Color(0xFFD4AF37), strokeWidth: 3)))
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        activeCueWord.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Arial',
                          letterSpacing: 0.5,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 1.5
                            ..color = const Color(0xFFD4AF37),
                          shadows: [
                            Shadow(offset: const Offset(0, 4), blurRadius: 10, color: Colors.red.shade900.withOpacity(0.85)),
                          ],
                        ),
                      ),
                      Text(
                        activeCueWord.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w900, fontFamily: 'Arial', letterSpacing: 0.5, color: Colors.white),
                      ),
                    ],
                  ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          "WORD ${currentWordIndex + 1} OF ${_currentFlashcardWord.length}",
          style: TextStyle(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 48),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), 
                  gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4), // White blurred backdrop drop shadow
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, 
                    shadowColor: Colors.transparent, 
                    foregroundColor: Colors.black, // High-contrast black button icon text face
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isDelayActive ? null : () {
                    _executeVoicePronunciationEngine(activeCueWord);
                    _triggerAdRefresherIncrement();
                  },
                  icon: const Icon(Icons.volume_up, size: 18, color: Colors.black),
                  label: const Text("HEAR AGAIN...", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: Colors.black, letterSpacing: 1.1)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), 
                  gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.4), // White blurred backdrop drop shadow
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, 
                    shadowColor: Colors.transparent, 
                    foregroundColor: Colors.black, // High-contrast black button font face
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: _isDelayActive ? null : () {
                    _advanceWordIndexTrackerOrRouteNext();
                    _triggerAdRefresherIncrement();
                  },
                  child: const Text("NEXT", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black, letterSpacing: 1.1)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

// ============================================================================
// WATCH YOUR LANGUAGE // PART 5 (A) - SPLIT 3: HIGH CONTRAST FULL SENTENCE CANVAS
// ============================================================================
  Widget _buildFullSentencePresentationScreen() {
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

    final Map<String, dynamic> activeLanguageData = countryGridMap.firstWhere(
      (element) => element['name'] == widget.languageName,
      orElse: () => {'name': 'Spanish', 'colors': [const Color(0xFFFF0000), const Color(0xFFFFCC00), const Color(0xFFFF0000)]},
    );
    final List<Color> activeFlagColors = activeLanguageData['colors'] as List<Color>;

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
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "THE FULL CHALLENGE SENTENCE:",
                        style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.shade900.withOpacity(0.55),
                              blurRadius: 16,
                              spreadRadius: 2,
                              offset: const Offset(0, 6),
                            ),
                          ],
                          gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
                          decoration: BoxDecoration(color: const Color(0xFF0F0F12), borderRadius: BorderRadius.circular(14)),
                          child: Text(
                            compiledForeignSentence, 
                            textAlign: TextAlign.center, 
                            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)
                          ),
                        ),
                      ),
                      const SizedBox(height: 48), // Spacing matches the cue card buttons distance layout
                      
                      Row(
                        children: [
                          // Hear Again Button with white blurred backdrop glow and black text
                          Expanded(
                            child: Container(
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12), 
                                gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.4),
                                    blurRadius: 12,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent, 
                                  shadowColor: Colors.transparent, 
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                ),
                                onPressed: () {
                                  _executeVoicePronunciationEngine(compiledForeignSentence);
                                  _triggerAdRefresherIncrement();
                                },
                                icon: const Icon(Icons.volume_up, size: 18, color: Colors.black),
                                label: const Text("HEAR AGAIN...", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 13, color: Colors.black, letterSpacing: 1.1)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          
                          // Your Turn Button with matching white blurred backdrop glow and black text
                          Expanded(
                            child: Container(
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12), 
                                gradient: LinearGradient(colors: activeFlagColors, begin: Alignment.topLeft, end: Alignment.bottomRight),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.4),
                                    blurRadius: 12,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent, 
                                  shadowColor: Colors.transparent, 
                                  foregroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                ),
                                onPressed: () {
                                  setState(() { isFullSentencePhase = false; isRecordingPhase = true; });
                                  _startRecordingCountdownSequence();
                                },
                                child: const Text("YOUR TURN", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.black, letterSpacing: 1.1)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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

// ============================================================================
// WATCH YOUR LANGUAGE // PART 5 (B): RECORDING CONTROLLERS & HORIZONTAL PROMPTER
// ============================================================================
  void _startRecordingCountdownSequence() {
    if (!mounted) {
      return;
    }
    setState(() {
      isCountdownRunning = true;
      productionCountdown = 3;
    });
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (productionCountdown > 1) {
        setState(() {
          productionCountdown--;
        });
      } else {
        timer.cancel();
        setState(() {
          isCountdownRunning = false;
          isCutButtonLocked = true;
        });
        _startLiveStudioVideoCaptureStream();
      }
    });
  }

  void _startLiveStudioVideoCaptureStream() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    try {
      await _cameraController!.startVideoRecording();
      if (mounted) {
        setState(() {
          isCutButtonLocked = false;
        });
      }
      _initializeDualScrollingTeleprompter();
    } catch (_) {}
  }

  void _initializeDualScrollingTeleprompter() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (_prompterScrollController != null && _prompterScrollController!.hasClients) {
        final double maxScroll = _prompterScrollController!.position.maxScrollExtent;
        _prompterScrollController!.animateTo(
          maxScroll,
          duration: const Duration(seconds: 10),
          curve: Curves.linear,
        );
      }
    });
  }

  Widget _buildLiveStudioRecordingScreen() {
    final String continuousScrollerText = "${compiledForeignSentence.toUpperCase()}               ${finalEnglishMeaning.toUpperCase()}          ";

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: (_cameraController == null || !_cameraController!.value.isInitialized)
                ? Container(color: const Color(0xFF0A0A0A), child: const Center(child: CircularProgressIndicator(color: Colors.amber)))
                : AspectRatio(aspectRatio: _cameraController!.value.aspectRatio, child: CameraPreview(_cameraController!)),
          ),
          if (isCountdownRunning)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.4),
                child: Center(
                  child: Text(
                    "$productionCountdown",
                    style: const TextStyle(color: Colors.amber, fontSize: 80, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          if (!isCountdownRunning)
            Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.75), borderRadius: BorderRadius.circular(10)),
                child: SingleChildScrollView(
                  controller: _prompterScrollController,
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: Text(
                      continuousScrollerText,
                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 2.0),
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade700,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: isCutButtonLocked ? null : _stopRecordingAndLaunchInterstitialVideoAd,
                child: const Text("CUT", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 1.1)),
              ),
            ),
          ),
        ],
      ),
    );
  }
// ============================================================================
// WATCH YOUR LANGUAGE // PART 5 (C): AD GATES, PLAYBACK DECK & SYSTEM DISPOSES
// ============================================================================
  void _stopRecordingAndLaunchInterstitialVideoAd() async {
    if (_cameraController == null || !_cameraController!.value.isRecordingVideo) {
      return;
    }
    try {
      final XFile videoFile = await _cameraController!.stopVideoRecording();
      if (mounted) {
        setState(() {
          isRecordingPhase = false;
        });
      }
      _displayFullScreenInterstitialVideoAdModal(videoFile.path);
    } catch (_) {}
  }

  void _displayFullScreenInterstitialVideoAdModal(final String cachedVideoLocationPath) {
    if (!mounted) {
      return;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              int videoAdSecondsRemaining = 5;
              
              Timer.periodic(const Duration(seconds: 1), (Timer t) {
                if (videoAdSecondsRemaining > 1) {
                  setModalState(() {
                    videoAdSecondsRemaining--;
                  });
                } else {
                  t.cancel();
                  Navigator.of(dialogContext).pop(); 
                  if (mounted) {
                    setState(() {
                      isPlaybackReviewPhase = true;
                    });
                  }
                }
              });

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.ondemand_video, color: Colors.amber, size: 75),
                    const SizedBox(height: 24),
                    const Text(
                      "📽️ PLAYING SPONSORED AD REWARD...",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.1),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "RETURNING TO APP IN: $videoAdSecondsRemaining SECONDS",
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 32),
                    const SizedBox(width: 36, height: 36, child: CircularProgressIndicator(color: Colors.amber, strokeWidth: 3)),
                  ],
                ),
              );
            }
          ),
        );
      },
    );
  }

  Widget _buildPostAdPlaybackReviewScreen() {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAdMobPlaceholderBannerUnit("TOP PLAYBACK REVIEW BANNER AD"),
              const SizedBox(height: 16),
              const Text(
                "WATCH YOUR REACTION TAKE:",
                style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade800),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.video_library, color: Colors.amber, size: 48),
                      SizedBox(height: 10),
                      Text(
                        "🎬 YOUR RECORDED TAKE PLAYBACK SUCCESSFUL",
                        style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "WHAT YOU ACTUALLY SAID:",
                style: TextStyle(color: Colors.amber, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.2),
              ),
              const SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.grey.shade900)),
                child: Text(
                  finalEnglishMeaning,
                  style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    _generateAutomatedComedyScript(); 
                  },
                  child: const Text("GO AGAIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, letterSpacing: 1.1)),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey.shade700, width: 1.5),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); 
                  },
                  child: const Text("TRY ANOTHER LANGUAGE", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.1)),
                ),
              ),
              const Spacer(),
              _buildAdMobPlaceholderBannerUnit("BOTTOM PLAYBACK REVIEW BANNER AD"),
            ],
          ),
        ),
      ),
    );
  }

  void _executeVoicePronunciationEngine(final String targetWord) async {
    if (targetWord.isEmpty || targetWord == "LOADING...") {
      return;
    }
    String targetedLocaleCode = "en-US";
    final String currentLang = widget.languageName;
    if (currentLang == "Spanish") { targetedLocaleCode = "es-ES"; }
    else if (currentLang == "French") { targetedLocaleCode = "fr-FR"; }
    else if (currentLang == "German") { targetedLocaleCode = "de-DE"; }
    else if (currentLang == "Italian") { targetedLocaleCode = "it-IT"; }
    try {
      await _flutterTts.setLanguage(targetedLocaleCode);
      await _flutterTts.setSpeechRate(0.42);
      await _flutterTts.speak(targetWord);
    } catch (_) {}
  }

  Widget _buildAdMobPlaceholderBannerUnit(final String adBannerTitleLabel) {
    return Container(
      key: ValueKey<String>("$adBannerTitleLabel-$adRefreshCounterSeed"),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade900, 
        borderRadius: BorderRadius.circular(6), 
        border: Border.all(color: Colors.amber.withOpacity(0.2)),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              "$adBannerTitleLabel // UPDATED_ID: $adRefreshCounterSeed", 
              style: TextStyle(color: Colors.amber.shade400, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1.1),
            ),
          ),
          Positioned(
            top: 4, 
            left: 6, 
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1), 
              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(2)), 
              child: const Text("AD", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 7)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _cameraController?.dispose();
    _prompterScrollController?.dispose();
    super.dispose();
  }
}
