sfdx force:org:create -f config/project-scratch-def.json -d 30 -s -w 3
sfdx force:source:push
sfdx force:user:password:generate
sfdx shane:data:dates:update -r 7-14-2020
sfdx force:data:bulk:upsert -s Contact -f data-modified/velostar-contacts.csv -i External_Id__c
sfdx force:data:bulk:upsert -s Contact -f data-modified/velostar-new-customers.csv -i External_Id__c
#Install EPB Model Accuracy Package
sfdx force:package:install -p 04t4J000002ASSJ
#Open org
sfdx force:org:open -p /lightning/setup/SetupOneHome/home
#sfdx force:org:open -p /lightning/page/home
