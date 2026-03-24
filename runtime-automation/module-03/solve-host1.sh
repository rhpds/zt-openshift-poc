#!/bin/sh
oc login --insecure-skip-tls-verify -u kubeadmin >> /tmp/progress.log 2>&1
oc new-project test-app >> /tmp/progress.log 2>&1
oc new-app httpd~https://github.com/sclorg/httpd-ex.git >> /tmp/progress.log 2>&1
oc expose service httpd-ex >> /tmp/progress.log 2>&1
echo "Solved module-03: CLI Access" >> /tmp/progress.log
