# Ruslan.Volkhov Maps App

## Add your files

- [ ] [Create](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#create-a-file) or [upload](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#upload-a-file) files
- [ ] [Add files using the command line](https://docs.gitlab.com/ee/gitlab-basics/add-file.html#add-a-file-using-the-command-line) or push an existing Git repository with the following command:

```
cd existing_repo
git remote add origin https://gitlab.extrawest.com/i-training/flutter/ruslan.volkhov_maps_app.git
git branch -M main
git push -uf origin main
```

## Test and Deploy

Use the built-in continuous integration in GitLab.

- [ ] [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/quick_start/index.html)
- [ ] [Analyze your code for known vulnerabilities with Static Application Security Testing(SAST)](https://docs.gitlab.com/ee/user/application_security/sast/)
- [ ] [Deploy to Kubernetes, Amazon EC2, or Amazon ECS using Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/requirements.html)
- [ ] [Use pull-based deployments for improved Kubernetes management](https://docs.gitlab.com/ee/user/clusters/agent/)
- [ ] [Set up protected environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html)

***

**5. Initialize empty folder with git**

`git init`

**6. Set remote url to your empty repository**

`git remote add origin https://gitlab.extrawest.com/user.name/your_empty_repository.git`

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

## Implemented Features

- MVVM (Provider+ChangeNotifiers) state sharing and state managing solution
- Fully featured localization / internationalization (i18n):
  - Pluralization support
  - Supports both languageCode (en) and languageCode_countryCode (en_US) locale formats
  - Automatically save & restore the selected locale
  - Full support for right-to-left locales
  - Fallback locale support in case the system locale is unsupported
  - Supports both inline or nested JSON
- NOSQL database integration (SEMBAST)
- Light/Dark theme configuration
- Dynamic Themes changing using Provider
- Automatic font selection based on the thickness of the glyphs applied.
- API client configuration
- DEV/STAGE/PROD application configuration
- Multilevel configurable logger
- Static analysis tool integration (flutter_lints package + custom rules config)
- Common widgets sharing and reusing example
- Resolution-aware images (1x,2x,3x sizes)

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
