abstract class PiktSettings {
  String get commandLineText;
}

class PiktGlobalSettings extends PiktSettings {

  final String? piktJar;
  final String? jvmCompiler;
  final String? nativeCompiler;

  PiktGlobalSettings({this.piktJar, this.jvmCompiler, this.nativeCompiler});

  @override
  String get commandLineText {
    final buffer = StringBuffer();

    if(piktJar != null) buffer.write('$piktJar ');
    if(jvmCompiler != null) buffer.write(' -Djvmcompiler=$jvmCompiler ');
    if(nativeCompiler != null) buffer.write(' -Dnativecompiler=$nativeCompiler ');

    return buffer.toString();
  }
}

class PiktProjectSettings extends PiktSettings {

  final String? colorScheme;
  final List<CompilationTarget>? compilationTargets;

  PiktProjectSettings({this.colorScheme, this.compilationTargets});

  @override
  String get commandLineText {
    final buffer = StringBuffer();

    if(colorScheme != null) buffer.write(' -Dcolors=$colorScheme ');
    if(compilationTargets != null) {
      buffer.write(' -Dtargets=');
      buffer.write(compilationTargets!.map((target) => target.toString().split('.').last).join(','));
    }

    return buffer.toString();
  }
}

enum CompilationTarget {
  jvm, windows, osx, linux
}