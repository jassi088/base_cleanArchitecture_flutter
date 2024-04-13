BUILD_CMD=./tools/build_and_run_app.sh

pub_get:
	sh clean.sh -f

update_app_icon:
	flutter pub run flutter_launcher_icons:main -f app_icon/app_icon.yaml

update_splash:
	flutter pub run flutter_native_splash:create --path=splash/splash.yaml

remove_splash:
	flutter pub run flutter_native_splash:remove --path=splash/splash.yaml

gen_env:
	dart run tools/gen_env.dart

run_dev:
	sh $(BUILD_CMD) develop run

run_qa:
	sh $(BUILD_CMD) qa run

run_stg:
	sh $(BUILD_CMD) staging run
	
run_prod:
	sh $(BUILD_CMD) production run

# It is used in CI/CD
build_dev_apk:
	sh $(BUILD_CMD) develop build apk

# It is used in CI/CD
build_qa_apk:
	sh $(BUILD_CMD) qa build apk

# It is used in CI/CD
build_stg_apk:
	sh $(BUILD_CMD) staging build apk

# It is used in CI/CD
build_prod_apk:
	sh $(BUILD_CMD) production build apk

ut:
	flutter test test/unit_test

chromedriver:
	chromedriver --port=4444

login_test_chrome:
	flutter drive \
	--driver=integration_test/test_driver/integration_driver.dart \
	--target integration_test/login_test.dart \
 	-d chrome 

login_test:
	flutter drive \
	--driver=integration_test/test_driver/integration_driver.dart \
	--target integration_test/login_test.dart \

main_test:
	flutter drive \
	--driver=integration_test/test_driver/integration_driver.dart \
	--target integration_test/main_test.dart \

