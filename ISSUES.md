# ISSUES

- Every app requires its own namespace (e.g. `Products`)
- How to load local changes in packages into docker for an app?
- App has composer.lock that is outdated after release (resolve via custom release worker?)

## Root app

To ease the development within this repo a custom set of tools would be preferable. There are several ways to resolve this:

- Makefile with loads of targets
- External tools (e.g. Lando.io)
- Custom cli

Wishes
- Easily create new bundles/libraries/apps with repeatable skeleton
- Easily run specific tools on (parts of) the repository (static analysis, tests, etc)
- Manage local environment (docker-compose up/down/build etc)
- Easily add specific parts of our structure to


