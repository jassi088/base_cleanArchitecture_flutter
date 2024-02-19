update_app_icon:
	flutter pub run flutter_launcher_icons:main -f app_icon/app_icon.yaml

update_splash:
	flutter pub run flutter_native_splash:create --path=splash/splash.yaml

remove_splash:
	flutter pub run flutter_native_splash:remove --path=splash/splash.yaml