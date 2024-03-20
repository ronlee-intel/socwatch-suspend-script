
echo "original suspend_cmd=${suspend_cmd}"

suspend_cmd="${SOCWATCH_INSTALL_PATH}/run_socwatch_suspend.sh"

echo "current suspend_cmd=${suspend_cmd}"

echo "args: $@"

pre_suspend_cmd=$(echo "$2" | awk -F 'pre_socwatch_suspend.sh' '{print $2}')
echo "pre_suspend_cmd: $pre_suspend_cmd"
if [ -n "$pre_suspend_cmd" ]; then
  echo "Running: ${pre_suspend_cmd}"
  ${pre_suspend_cmd}
fi
