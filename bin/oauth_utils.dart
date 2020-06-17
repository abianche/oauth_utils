import 'package:oauth_utils/oauth_utils.dart' as oauth_utils;

void main(List<String> arguments) {
  final code_verifier = oauth_utils.generateCodeVerifier();
  print('code_verifier $code_verifier');

  final code_challenge = oauth_utils.getCodeChallenge(code_verifier);
  print('code_challenge $code_challenge');
}
