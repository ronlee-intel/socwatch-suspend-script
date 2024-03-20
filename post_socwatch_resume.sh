
# Remove SOCWatch logs older than 10 minutes
find /var/log/socwatch -mmin +10 -type f -exec rm -fv {} \;

echo "args: $@"

post_resume_cmd=$(echo "$4" | awk -F 'post_socwatch_resume.sh' '{print $2}')
echo "post_resume_cmd=$post_resume_cmd"
if [ -n "$post_resume_cmd" ]; then
  echo "Running: ${post_resume_cmd}"
  ${post_resume_cmd}
fi
