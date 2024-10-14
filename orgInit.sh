sf demoutil org create scratch -f config/project-scratch-def.json -d 5 -s -p customer -e churn.workshop
sf project deploy start
sf demoutil user password set -p salesforce1 -g User -l User
sfdx shane:data:dates:update -r 7-14-2020
sf data bulk upsert -s Contact -f data-modified/velostar-contacts.csv -i External_Id__c
sf data bulk upsert -s Contact -f data-modified/velostar-new-customers.csv -i External_Id__c
#Install EPB Model Accuracy Package
sfdx force:package:install -p 04t4J000002ASSJ
#Open org
sf org open
