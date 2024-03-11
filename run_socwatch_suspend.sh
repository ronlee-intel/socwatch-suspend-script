#!/bin/bash

wakeup_count=""
suspend_for_sec=""

echo "args: $@"

for arg in "$@"
do
    case $arg in
        --wakeup_count=*)
            wakeup_count="${arg#*=}"
            mkdir -p /var/run/socwatch_suspend
            echo "$wakeup_count" > /var/run/socwatch_suspend/wakeup_count
            ;;
        --suspend_for_sec=*)
            suspend_for_sec="${arg#*=}"
            ;;
        *)
            # Unknown argument (optional handling)
            echo "Unknown argument: $arg"
            ;;
    esac
done


socwatch_exe="${SOCWATCH_INSTALL_PATH}/socwatch"
socwatch_out="/var/log/socwatch/$(date +%Y%m%d-%H%M%S)"

## Change suspend_cmd to socwatch
if [ -n "$suspend_for_sec" ]; then
  #suspend_cmd="${socwatch_exe} -m -z -s 0 -t ${suspend_for_sec} --option pch-count-always -f sa-freq -f sys -f device -f xhci -f pcie -f s0ix-subs-res -f s0ix-subs-status -f gfx -f panel-srr -f pkg-pwr -f cpu-pkgc-dbg -f pch-all -f pch-slps0 -f pch-ip-active -f pch-ip-status -f cpu -f pch -f cpu-cstate -f cpu-pstate -o ${socwatch_out}"
  suspend_cmd="${socwatch_exe} -m -z -s 0 -t ${suspend_for_sec} -f sys -f device -f xhci -f pcie  -f chipset-all -f pch-slps0-dbg -f s0ix-subs-res -f s0ix-subs-status -f gfx -f panel-srr -f pkg-pwr -f cpu-pkgc-dbg -f pch-slps0 -f pch-ip-active -f cpu -f cpu-cstate -f cpu-pstate -o ${socwatch_out} > /dev/null 2>&1"
fi

echo "suspend_cmd=${suspend_cmd}"
eval "$suspend_cmd"
