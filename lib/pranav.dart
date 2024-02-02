import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 0, 32, 63),
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 32, 63),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AuthScreen(),
      debugShowCheckedModeBanner: false, // Hide debug banner
    );
  }
}

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Icon(
                      Icons.local_hospital,
                      color: Color.fromARGB(255, 34, 161, 178),
                      size: 50.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                AuthForm(),
                SizedBox(height: 20.0),
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to signup page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color.fromARGB(255, 34, 161, 178),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          style: TextStyle(color: Colors.white),
          decoration: buildInputDecoration('Email', Icons.email),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: passwordController,
          obscureText: true,
          style: TextStyle(color: Colors.white),
          decoration: buildInputDecoration('Password', Icons.lock),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () async {
            // Implement login logic here
            // For demo, navigate to the patient dashboard
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientDashboard()),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            primary: Color.fromARGB(255, 34, 161, 178),
          ),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
        SizedBox(height: 12.0),
        TextButton(
          onPressed: () {
            // Implement forgot password logic here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgotPasswordScreen()),
            );
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Icon(
                      Icons.local_hospital,
                      color: Color.fromARGB(255, 34, 161, 178),
                      size: 50.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                SignupForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController typeOfDoctorController = TextEditingController();

  bool isDoctor = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          style: TextStyle(color: Colors.white),
          decoration: buildInputDecoration('Name', Icons.person),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: contactController,
          keyboardType: TextInputType.phone,
          style: TextStyle(color: Colors.white),
          decoration: buildInputDecoration('Contact No', Icons.phone),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.white),
          decoration: buildInputDecoration('Email', Icons.email),
        ),
        SizedBox(height: 10.0),
        TextField(
          controller: passwordController,
          obscureText: true,
          style: TextStyle(color: Colors.white),
          decoration: buildInputDecoration('Password', Icons.lock),
        ),
        if (isDoctor)
          Column(
            children: [
              SizedBox(height: 10.0),
              TextField(
                controller: typeOfDoctorController,
                style: TextStyle(color: Colors.white),
                decoration: buildInputDecoration(
                    'Type of Doctor', Icons.medical_services),
              ),
            ],
          ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () async {
            // Implement signup logic here
            // For demo, navigate to the patient dashboard
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PatientDashboard()),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
            primary: Color.fromARGB(255, 34, 161, 178),
          ),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: isDoctor
                ? Text(
                    'Sign Up as Doctor',
                    key: Key('doctor'),
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  )
                : Text(
                    'Sign Up as Patient',
                    key: Key('patient'),
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
          ),
        ),
        SizedBox(height: 12.0),
        GestureDetector(
          onTap: () {
            setState(() {
              isDoctor = !isDoctor;
            });
          },
          child: Text(
            isDoctor ? 'Switch to Patient' : 'Switch to Doctor',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    child: Icon(
                      Icons.local_hospital,
                      color: Color.fromARGB(255, 34, 161, 178),
                      size: 50.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ForgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          style: TextStyle(color: Colors.white),
          decoration: buildInputDecoration('Email', Icons.email),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () async {
            // Implement forgot password logic here
            // For demo, show a confirmation message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Password reset email sent. Check your inbox.'),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            primary: Color.fromARGB(255, 34, 161, 178),
          ),
          child: Text(
            'Reset Password',
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  InputDecoration buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(25.0),
      ),
    );
  }
}

class PatientDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GreetingsWidget(),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashboardButton(
                    title: 'Doctor\nAppointment',
                    icon: Icons.calendar_today,
                    onTap: () {
                      // Navigate to doctor appointment screen
                    },
                  ),
                  DashboardButton(
                    title: 'Lab Test\nBooking',
                    icon: Icons.assignment,
                    onTap: () {
                      // Navigate to lab test booking screen
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DashboardButton(
                    title: 'Upload Past\nPrescriptions',
                    icon: Icons.file_upload,
                    onTap: () {
                      // Navigate to upload prescriptions screen
                    },
                  ),
                  DashboardButton(
                    title: 'Chat\nApplication',
                    icon: Icons.chat,
                    onTap: () {
                      // Navigate to chat application screen
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              RecommendedLabTests(),
              SizedBox(height: 20.0),
              ReadAboutHealth(),
            ],
          ),
        ),
      ),
    );
  }
}

class GreetingsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, [Patient Name]!',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'How can we assist you today?',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DashboardButton(
      {required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color.fromARGB(255, 34, 161, 178),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(
                icon,
                size: 40.0,
                color: Colors.white,
              ),
              SizedBox(height: 10.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedLabTests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommended Lab Tests',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  LabTestCard('Blood Test', 'Complete blood count'),
                  LabTestCard('Urinalysis', 'Analysis of urine sample'),
                  LabTestCard('Cholesterol Test', 'Lipid profile analysis'),
                  LabTestCard('Blood Sugar Test', 'Glucose level measurement'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LabTestCard extends StatelessWidget {
  final String title;
  final String description;

  LabTestCard(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadAboutHealth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Read About Health',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HealthArticleCard('Importance of Sleep',
                      'Getting a good night\'s sleep is crucial for overall health.'),
                  HealthArticleCard('Benefits of a Healthy Diet',
                      'Eating a balanced diet contributes to better well-being.'),
                  HealthArticleCard('Stress Management',
                      'Learn effective ways to manage stress in your life.'),
                  HealthArticleCard('Exercise for a Healthy Life',
                      'Regular exercise has numerous health benefits.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HealthArticleCard extends StatelessWidget {
  final String title;
  final String description;

  HealthArticleCard(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
