#!/bin/bash
# echo "unset ARM_* rnv variables"
# unset ARM_CLIENT_ID
# unset ARM_CLIENT_SECRET
# unset ARM_TENANT_ID
# unset ARM_SUBSCRIPTION_ID

echo "configure service principal auth"

ARM_CLIENT_ID="b3ba4b4f-22cc-4283-ada3-b0126e9be570" 
ARM_CLIENT_SECRET="GI48Q~TV33P31bwxak35e~u9~lg.s~RiobaBja~r"
ARM_SUBSCRIPTION_ID="d1ac2c8c-6294-46bc-ae8c-4188669ccbbc"
ARM_TENANT_ID="a2091806-2bd5-424d-a1ec-8b44a0373dd1"
export ARM_CLIENT_ID
export ARM_CLIENT_SECRET
export ARM_TENANT_ID
export ARM_SUBSCRIPTION_ID