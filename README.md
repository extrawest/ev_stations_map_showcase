# Ruslan.Volkhov Maps App


## CREATE CREDENTIALS FILES FOR DEVELOPMENT AND PRODUCTION MODE

Create `credentials_production.json` and `credentials_development.json` inside the `assets` folder.
Do not add these files to GIT!
Files should have the following structure:

```json
{
  "appName": "",
  "flavorName": "",
  "apiDomain": ""
}
```
Where:
- `flavorName` could be 'prod' or 'dev' (depends on the environment)
- Values for `appName` and `flavorName` should be according to your project respectively
- Value for `apiDomain`, can be obtained on the backend

## RUN THE APP IN DEVELOPMENT OR PRODUCTION MODE

In order to run in production mode provide an additional `IS_PRODUCTION` argument to the run
command:

```shell
flutter run --dart-define IS_PRODUCTION=true
```

Important! To create the production build of the app you should also provider an
additional `--dart-define IS_PRODUCTION=true` argument:

```shell
flutter build ipa --dart-define IS_PRODUCTION=true
```


### Contributing

1. Fork it!
1. Create your feature branch: `git checkout -b new-cool-tip`
1. Commit your changes: `git commit -am 'Added new tip'`
1. Push to the branch: `git push origin new-cool-tip`
1. Submit a pull request.

---
Created by Extrawest Mobile Team
[Extrawest.com](https://www.extrawest.com), 2022
---
## Generate code
fvm flutter pub run build_runner build --delete-conflicting-outputs

##  Run App with arguments for using Google map:
#   For Android:
fvm flutter run --dart-define DEFINE_ANDROID_KEY=API_KEY_FOR_ANDROID

#   For iOS:
fvm flutter run --dart-define DEFINE_IOS_KEY=API_KEY_FOR_IOS

#   For web:
fvm flutter run --dart-define DEFINE_WEB_KEY=API_KEY_FOR_WEB