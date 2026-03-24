#!/bin/sh
if oc get project test-app >> /tmp/progress.log 2>&1 && \
   oc get route httpd-ex -n test-app >> /tmp/progress.log 2>&1; then
  echo "PASS: module-03 validated" >> /tmp/progress.log
  exit 0
else
  echo "FAIL: module-03 validation failed" >> /tmp/progress.log
  exit 1
fi
