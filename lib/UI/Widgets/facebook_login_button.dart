import '../../export.dart';

class FacebookLogin extends StatelessWidget {
  const FacebookLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
                  .FacebookLogo, // Replace with the path to your Google logo image
              height: 30.0,
              width: 30.0,
            ),
            Text('Countinue with Facebook')
          ],
        ),
      ),
    );
  }
}
