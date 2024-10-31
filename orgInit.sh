#!/usr/bin/env bash
sf demoutil org create scratch -f config/project-scratch-def.json -d 5 -s -p customer -e churn.workshop
sf project deploy start
sf demoutil user password set -p salesforce1 -g User -l User
sfdx shane:data:dates:update -r 7-14-2020
sf automig load -d automig
sf package install -p 04t4J000002ASSJ
sf org open
