#!/bin/bash

source /root/admin_openrc_2.0.sh
heat-keystone-setup-domain \
    --stack-user-domain-name heat_user_domain \
    --stack-domain-admin heat_domain_admin \
    --stack-domain-admin-password {{ heat_domain_pass }} 2>/dev/null| grep stack_user_domain_id|cut -d= -f2

