import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Sinup extends StatelessWidget {
  Future<void> _signInWithGitHub(BuildContext context) async {
    final String githubClientId = '';
    final String githubRedirectUri = 'YOUR_GITHUB_REDIRECT_URI';

    final String githubAuthUrl =
        'https://github.com/login/oauth/authorize?client_id=$githubClientId&redirect_uri=$githubRedirectUri&scope=user';

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('GitHub Sign-In'),
          ),
          body: WebViewContainer(
            url: githubAuthUrl,
            onCodeReceived: (code) async {
              // Exchange the received code for a GitHub token using a backend server
              // and then authenticate the user with Firebase
              // (GitHub OAuth flows typically require a backend to handle the exchange).
              // You need to implement this part on your backend server.
              print('Received GitHub code: $code');

              // After authentication, you can redirect to the user details page
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => MyUserDetailsPage(),
                ),
              );
            },
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Gitbit',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _signInWithGitHub(context),
              child: Text('Sign In with GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}

class MyUserDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome, GitHub User'),
            // Display user details here
          ],
        ),
      ),
    );
  }
}

class MyColors {
  static const Color darkGrey = Color(0xFF0F0F0F);
}

class WebViewContainer extends StatelessWidget {
  final String url;
  final Function(String) onCodeReceived;

  WebViewContainer({required this.url, required this.onCodeReceived});

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: url,
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('YOUR_GITHUB_REDIRECT_URI')) {
          final code = Uri.parse(request.url).queryParameters['code'];
          if (code != null) {
            onCodeReceived(code);
          }
        }
        return NavigationDecision.navigate;
      },
    );
  }
}
