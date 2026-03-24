#!/bin/bash
USER=rhel

echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "Installing OpenShift CLI tools..." > /tmp/progress.log
chmod 666 /tmp/progress.log

OCP_VERSION="${OCP_VERSION:-stable}"
curl -sL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OCP_VERSION}/openshift-client-linux.tar.gz \
  | tar xzf - -C /usr/local/bin oc kubectl
chmod +x /usr/local/bin/oc /usr/local/bin/kubectl

oc completion bash > /etc/bash_completion.d/oc

echo "OpenShift CLI tools installed" >> /tmp/progress.log

