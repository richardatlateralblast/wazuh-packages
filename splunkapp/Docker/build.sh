#!/bin/bash

build_package() {
    
    cd /pkg
    tar -zcvf ${wazuh_splunk_pkg_name} SplunkAppForWazuh
    if [[ $4 == "yes"]]; then
         sha512sum "${wazuh_splunk_pkg_name}" > "${wazuh_splunk_pkg_name}".sha512
    fi
    mv ${wazuh_splunk_pkg_name}.* ../wazuh_splunk_app
    cd ..
}
if [ $3 == "" ]; then
    wazuh_splunk_pkg_name="SplunkAppForWazuh_v$1_$2.tar.gz"
else
    wazuh_splunk_pkg_name="SplunkAppForWazuh_v$1_$2_$3.tar.gz"
fi
build_package
