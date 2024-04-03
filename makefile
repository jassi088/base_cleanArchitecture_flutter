BUILD_CMD=./tools/build_and_run_app.sh

update_app_icon:
	flutter pub run flutter_launcher_icons:main -f app_icon/app_icon.yaml

update_splash:
	flutter pub run flutter_native_splash:create --path=splash/splash.yaml

remove_splash:
	flutter pub run flutter_native_splash:remove --path=splash/splash.yaml

gen_env:
	dart run tools/gen_env.dart

chromedriver:
	chromedriver --port=4444

# login_test_chrome:
# 	flutter drive \
# 	--driver=integration_test/test_driver/integration_driver.dart \
# 	--target integration_test/login_test.dart \
#  	-d chrome 

login_test:
	flutter drive \
	--driver=integration_test/test_driver/integration_driver.dart \
	--target integration_test/login_test.dart \

main_test:
	flutter drive \
	--driver=integration_test/test_driver/integration_driver.dart \
	--target integration_test/main_test.dart \

auth_test:
	flutter drive \
	--driver=integration_test/test_driver/integration_driver.dart \
	--target integration_test/auth_test.dart \
