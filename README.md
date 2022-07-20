# Juno App

A mobile application when you can search the exchange rate of USD to COP in different periods of time.

## Getting Started

This application works based on BLoC state management library to consume the manage the different data used along of the application. It's connected to an [API](https://polygon.io/stocks?gclid=CjwKCAjw2rmWBhB4EiwAiJ0mtQMvXLbQBzpC1Wz9rkrrN1iXBlgpKIAvem_mYj5lWlHsef0ls-b0ZhoCNVAQAvD_BwE) to know the exchange rate according to the period of time selected.

## How to use

**Step 1:**

Download or clone this repo by using the link below:

``https://github.com/s15-coder/juno_app.git``

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:}

``flutter pub get ``

**Step 3:**

Let's run the application!

## Libraries & Tools Used
 
  * [Equatable](https://pub.dev/packages/equatable): Makes easier compare different objects that have exactly the same properties.
  * [Flutter Bloc](https://pub.dev/packages/flutter_bloc): Provide us the BLoC state management methods.
  * [Font Awesome Flutter](https://pub.dev/packages/font_awesome_flutter): Additional iconography to the default.
  * [Http](https://pub.dev/packages/http): Allows make network requests.
  * [Intl](https://pub.dev/packages/intl): Format ceratain currencies and dates according to the given parameters as language or country.
  * [Syncfusion Flutter Charts](https://pub.dev/packages/syncfusion_flutter_charts): Beatiful charts to show different kinds of data in a fancy way.

  ## Folder Structure

  Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

This is the estructure used specifically in this project:

```
lib/
|- bloc
|- config
|- helpers
|- models
|- pages
|- routes
|- services
|- theme
|- widgets
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- bloc - Contains the different BLoCs used along the application
2- config - Global variables which may change the app behavior 
3- helpers - Code that may be used in different parts of the app to complement functionality.
4- models - Contains all the models or templates of the data used along the app.
5- pages - Contains the files where are sited the app screens.
6- routes - All functionality related to navition inside the app.
7- services - Contains the implementation of determined features in a comprehensible way.
8- theme - All settings related to the app theme (DarkMode or LightMode)
9- widgets - UI components of the application which may be reused.
```

