run-dev:
	flutter run --flavor dev --dart-define=ENVIRONMENT=dev

run-prod:
	flutter run --flavor prod --dart-define=ENVIRONMENT=prod

run-release:
	flutter run --flavor prod --dart-define=ENVIRONMENT=prod --release

build-dev:
	flutter build --flavor dev --dart-define=ENVIRONMENT=dev

build-prod:
	flutter build --flavor prod --dart-define=ENVIRONMENT=prod

build-runner:
	dart run build_runner build --delete-conflicting-outputs