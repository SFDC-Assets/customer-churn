sfdx shane:org:create -f config/project-scratch-def.json -d 30 -s --wait 60 --userprefix customer -o churn.workshop
sfdx force:source:push
sfdx shane:user:password:set -g User -l User -p salesforce1
sfdx shane:data:dates:update -r 7-14-2020
sfdx force:data:bulk:upsert -s Contact -f data-modified/velostar-contacts.csv -i External_Id__c
sfdx force:data:bulk:upsert -s Contact -f data-modified/velostar-new-customers.csv -i External_Id__c
#Install EPB Model Accuracy Package
sfdx force:package:install -p 04t4J000002ASSJ
#Open org
sfdx force:org:open -p /lightning/setup/SetupOneHome/home
#sfdx force:org:open -p /lightning/page/home
