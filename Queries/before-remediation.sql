-- Cloud IAM Security Lab
-- Scenario 1: Finance access before remediation

SELECT
    eventtime,
    eventname,
    useridentity.arn AS identity_arn,
    sourceipaddress,
    useragent,
    requestparameters,
    errorcode,
    errormessage
FROM cloudtrail_logs_nexora_cloudtrail_logs_684
WHERE eventsource = 's3.amazonaws.com'
  AND eventname = 'GetObject'
  AND requestparameters LIKE '%nexora-finance-data-684%'
  AND requestparameters LIKE '%finance-test.txt.txt%'
  AND eventtime LIKE '2026-10-08%'
ORDER BY eventtime DESC
LIMIT 100;