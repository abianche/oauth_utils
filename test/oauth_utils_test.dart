import 'package:test/test.dart';
import 'package:oauth_utils/oauth_utils.dart';

void main() {
  test('getCodeChallenge', () {
    final code_verifier = generateCodeVerifier();
    expect(getCodeChallenge(code_verifier), getCodeChallenge(code_verifier));
  });
}
