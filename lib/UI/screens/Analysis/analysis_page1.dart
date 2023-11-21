import 'package:cpa/data/dummy.dart';
import 'package:cpa/export.dart';

class AnalysisScreen1 extends StatelessWidget {
  const AnalysisScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _foodAllergiesController =
        TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(CPAAssets.CpaLogo),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Let's Start...",
                  style: CPATextTheme().heading4,
                ),
              ),
              SizedBoxes.verticalTiny,
              Align(
                alignment: Alignment.topLeft,
                child: ProgressBar(
                  value: 0.2,
                  backgroundColor: CPAColorTheme().white,
                  fillColor: CPAColorTheme().primaryblue,
                ),
              ),
              SizedBoxes.verticalMedium,
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Basic Info',
                  style: CPATextTheme().body,
                ),
              ),
              SizedBoxes.verticalLarge,
              CustomTextField(
                controller: _nameController,
                hintText: 'Full Name',
                hintStyle: CPATextTheme()
                    .subtext
                    .copyWith(color: CPAColorTheme().neutral400),
              ),
              SizedBoxes.verticalLarge,
              CustomTextField(
                controller: _addressController,
                hintText: 'Full Address',
                hintStyle: CPATextTheme()
                    .subtext
                    .copyWith(color: CPAColorTheme().neutral400),
              ),
              SizedBoxes.verticalLarge,
              const Text(
                  'How long do you want your Comprehensive Preparedness Analysis (CPA) to cover?'),
              SizedBoxes.verticalLarge,
              const DaysTag(),
              SizedBoxes.verticalLarge,
              const Row(
                children: [
                  Text('How many Adults (1-8)'),
                  Text('(Over the age of 12)')
                ],
              ),
              SizedBoxes.verticalLarge,
              const AdultsTag(),
              SizedBoxes.verticalLarge,
              const Row(
                children: [
                  Text('How many children '),
                  Text('(12 years of age or younger)'),
                ],
              ),
              SizedBoxes.verticalTiny,
              Text(
                'The total for both adults and children should not exceed 8 total people if more, you will need to call SM direct for analysis.',
                style:
                    CPATextTheme().small.copyWith(color: CPAColorTheme().red),
              ),
              SizedBoxes.verticalLarge,
              const ChildrenTag(),
              SizedBoxes.verticalLarge,
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Are there any food allergies? ')),
              SizedBoxes.verticalLarge,
              CustomTextField(
                controller: _foodAllergiesController,
                hintText: 'peanuts, sunflower seeds....',
                hintStyle: CPATextTheme()
                    .subtext
                    .copyWith(color: CPAColorTheme().neutral400),
              ),
              SizedBoxes.verticalLarge,
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                    buttonText: 'Next',
                    onPressed: () {
                      fName = _nameController.text.toString();
                      fAddress = _addressController.text.toString();
                      foodAllergies = _foodAllergiesController.text.toString();
                      print("___________________________________");
                      print(fName);
                      print(fAddress);
                      print(foodAllergies);
                      print(cpaLong);
                      print(noOfAdults);
                      print(noOfChildren);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AnalysisScreen2()));
                    }),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class DaysTag extends StatefulWidget {
  const DaysTag({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DaysTagState createState() => _DaysTagState();
}

class _DaysTagState extends State<DaysTag> {
  String selectedTag = ''; // Store the selected tag

  void selectTag(String tag) {
    setState(() {
      selectedTag = tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildTag(
              '30 days',
              CPAColorTheme().primaryblue,
              onTap: () {
                cpaLong = '30 days';
              },
            ),
            SizedBoxes.horizontalMedium,
            buildTag(
              '60 days',
              CPAColorTheme().primaryblue,
              onTap: () {
                cpaLong = '30 days';
              },
            ),
            SizedBoxes.horizontalMedium,
            buildTag(
              '90 days',
              CPAColorTheme().primaryblue,
              onTap: () {
                cpaLong = '30 days';
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTag(String tag, Color backgroundColor,
      {required Function()? onTap}) {
    bool isSelected = selectedTag == tag;
    return GestureDetector(
      onTap: () {
        selectTag(tag);
        onTap!();
      },
      child: Container(
        width: 100,
        height: 37,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : Colors.white,
          border: Border.all(
            color: CPAColorTheme().primaryblue,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          tag,
          style: TextStyle(
            color: isSelected ? Colors.white : CPAColorTheme().primaryblue,
          ),
        ),
      ),
    );
  }
}

class AdultsTag extends StatefulWidget {
  const AdultsTag({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdultsTagState createState() => _AdultsTagState();
}

class _AdultsTagState extends State<AdultsTag> {
  String selectedTag = ''; // Store the selected tag

  void selectTag(String tag) {
    setState(() {
      selectedTag = tag;
      noOfAdults = tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTag('01', CPAColorTheme().primaryblue),
            buildTag('02', CPAColorTheme().primaryblue),
            buildTag('03', CPAColorTheme().primaryblue),
            buildTag('04', CPAColorTheme().primaryblue),
            buildTag('05', CPAColorTheme().primaryblue),
            buildTag('06', CPAColorTheme().primaryblue),
            buildTag('07', CPAColorTheme().primaryblue),
            buildTag('08', CPAColorTheme().primaryblue),
          ],
        ),
      ),
    );
  }

  Widget buildTag(String tag, Color backgroundColor) {
    bool isSelected = selectedTag == tag;
    return GestureDetector(
      onTap: () => selectTag(tag),
      child: Container(
        width: 58, // Adjust width here
        height: 37, // Adjust height here
        margin:
            const EdgeInsets.symmetric(horizontal: 8), // Add margin for spacing
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : Colors.white,
          border: Border.all(
            color: CPAColorTheme().primaryblue,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            tag,
            style: TextStyle(
              color: isSelected ? Colors.white : CPAColorTheme().primaryblue,
            ),
          ),
        ),
      ),
    );
  }
}

class ChildrenTag extends StatefulWidget {
  const ChildrenTag({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChildrenTagState createState() => _ChildrenTagState();
}

class _ChildrenTagState extends State<ChildrenTag> {
  String selectedTag = ''; // Store the selected tag

  void selectTag(String tag) {
    setState(() {
      selectedTag = tag;
      noOfChildren = tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTag('01', CPAColorTheme().primaryblue),
            buildTag('02', CPAColorTheme().primaryblue),
            buildTag('03', CPAColorTheme().primaryblue),
            buildTag('04', CPAColorTheme().primaryblue),
            buildTag('05', CPAColorTheme().primaryblue),
            buildTag('06', CPAColorTheme().primaryblue),
            buildTag('07', CPAColorTheme().primaryblue),
            buildTag('08', CPAColorTheme().primaryblue),
          ],
        ),
      ),
    );
  }

  Widget buildTag(String tag, Color backgroundColor) {
    bool isSelected = selectedTag == tag;
    return GestureDetector(
      onTap: () => selectTag(tag),
      child: Container(
        width: 58, // Adjust width here
        height: 37, // Adjust height here
        margin:
            const EdgeInsets.symmetric(horizontal: 8), // Add margin for spacing
        decoration: BoxDecoration(
          color: isSelected ? backgroundColor : Colors.white,
          border: Border.all(
            color: CPAColorTheme().primaryblue,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            tag,
            style: TextStyle(
              color: isSelected ? Colors.white : CPAColorTheme().primaryblue,
            ),
          ),
        ),
      ),
    );
  }
}
