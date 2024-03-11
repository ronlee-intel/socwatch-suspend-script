# socwatch-suspend-script
CrOS suspend stress test script with socwatch

## Usage:
- Copy these scripts to your socwatch package folder, ex: /usr/local/socwatch_chrome_CUSTOM
- Run `install_socwatch_suspend`
- Run `suspend_stress_test -c 1` and check if it could generate socwatch log in /var/log/socwatch
- Run `uninstall_socwatch_suspend` if suspend stress test completed
- Run `suspend_stress_test -c 1` to check if it use original suspend command
