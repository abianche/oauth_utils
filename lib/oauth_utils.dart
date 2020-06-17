import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

String generateCodeVerifier() {
  final _random = Random.secure();
  var values = List<int>.generate(32, (i) => _random.nextInt(256));

  return base64Url.encode(values);
}

String getCodeChallenge(String codeVerifier) {
  final bytes = utf8.encode(codeVerifier);

  final digest = sha256.convert(bytes);

  var codeChallenge = base64UrlEncode(digest.bytes);

  if (codeChallenge.endsWith('=')) {
    // Since code challenge must contain only chars in the range ALPHA | DIGIT | "-" | "." | "_" | "~" (see https://tools.ietf.org/html/rfc7636#section-4.2)
    // many OAuth2 servers (read "Google") don't accept the "=" at the end of the base64 encoded string
    codeChallenge = codeChallenge.substring(0, codeChallenge.length - 1);
  }

  return codeChallenge;
}
