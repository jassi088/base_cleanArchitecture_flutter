update_app_icon:
	cd app && flutter pub run flutter_launcher_icons:main -f app_icon/app-icon.yaml

update_splash:
	flutter pub run flutter_native_splash:create --path=splash/splash.yaml

remove_splash:
	flutter pub run flutter_native_splash:remove --path=splash/splash.yaml