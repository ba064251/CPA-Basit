import '../../export.dart';

class GoogleLogin extends StatelessWidget {
  const GoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: CPAColorTheme().white, // Change the outline color as needed
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            CPAAssets
                .GoogleLogo, // Replace with the path to your Google logo image
            height: 30.0,
            width: 30.0,
          ),
          Text('Countinue with Google')
        ],
      ),
    );
  }
}
