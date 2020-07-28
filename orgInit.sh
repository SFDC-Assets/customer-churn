sfdx force:org:create -f config/project-scratch-def.json -d 10 -s -w 3
sfdx force:source:push
sfdx force:user:password:generate
sfdx shane:data:dates:update -r 7-14-2020
sfdx force:data:bulk:upsert -s Contact -f data-modified/velostar-contacts.csv -i External_Id__c
sfdx force:data:bulk:upsert -s Contact -f data-modified/velostar-new-customers.csv -i External_Id__c
sfdx force:org:open -p /lightning/page/home
#Add Tab
#sfdx shane:object:tab -o Loan__c -i 17
#Add PermissionSet
#sfdx shane:permset:create -n LoanAdmin -o Loan__c -t
#Ok, we're ready to deploy all of this stuff
#sfdx force:org:create -f config/project-scratch-def.json -d 3 -s -w 3
#push source code into scratch org
#sfdx force:source:push
#create user
#sfdx force:user:password:generate
#assign permset to user
#sfdx force:user:permset:assign --permsetname LoanAdmin
#Bulk Load data
#sfdx force:data:bulk:upsert -s Loan__c -f data/loans.csv -i LOAN_ID__C
#Install EPB Model Accuracy Package
#sfdx force:package:install -p 04t4J000002ASSJ
#Open org
#sfdx force:org:open -p /lightning/setup/SetupOneHome/home
#sfdx force:org:open -p /lightning/page/home