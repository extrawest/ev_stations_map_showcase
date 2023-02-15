# Ruslan.Volkhov Maps App


**7. Add all files to git**

`git add .`

**8. Commit all the files with 'initial commit' commit message**

`git commit -m "initial commit"`

**9. Push to remote repository**

`git push -u origin main`

## Instructions on how to build, run and config
## Localization

### 1. Update en.json and other json dictionaries under the assets/i18n folder

### 2. Load assets:

```shell
flutter pub run easy_localization:generate --source-dir assets/i18n
```

### 3. Generate static keys for translations

```shell
flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir assets/i18n
```

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