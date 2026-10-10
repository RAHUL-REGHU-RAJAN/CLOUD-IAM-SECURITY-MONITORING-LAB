# ☁️ Cloud IAM Security & Monitoring Lab

🛡️ **Identity & Access Management, Security Monitoring, and Misconfiguration Remediation**  
🏢 **Environment:** Nexora Systems — Simulated Cloud Environment  
☁️ **Platform:** Amazon Web Services (AWS)

![AWS](https://img.shields.io/badge/AWS-Cloud%20Security-orange?logo=amazonaws) ![IAM](https://img.shields.io/badge/IAM-Least%20Privilege-blue) ![CloudTrail](https://img.shields.io/badge/Audit-AWS%20CloudTrail-purple) ![Athena](https://img.shields.io/badge/Analysis-Amazon%20Athena-green)

## 🚀 1. Project Overview

The **Cloud IAM Security & Monitoring Lab** is a hands-on cloud security project built in a controlled AWS environment. It demonstrates identity and access management, role-based access control, Amazon S3 resource permissions, audit logging, and security event investigation.

The lab evaluates how excessive permissions can expose data across team boundaries. AWS CloudTrail records are investigated using Amazon Athena, while permission remediation and retesting help validate least-privilege access controls.

This is an educational and portfolio project conducted using test identities and sample resources in an AWS environment configured by the author. It is not a real-world breach or a formal third-party security audit.

## 🎯 2. Objectives

- Configure a cloud environment with structured identity and access controls.
- Manage users, groups, and permission sets through AWS IAM Identity Center.
- Assess excessive Amazon S3 permissions through controlled testing.
- Investigate audit events using AWS CloudTrail and Amazon Athena.
- Remove unauthorized access and validate remediation through retesting.
- Document findings and practical security recommendations.

## 🏗️ 3. Architecture

The lab uses a simulated organization, **Nexora Systems**, with separate S3 buckets representing Development, Finance, HR, and Security data boundaries.

Add the architecture image to the repository and update the path below if its filename differs.

![Cloud IAM Security Lab Architecture](Diagrams/Cloud%20IAM%20Security%20Monitoring%20Architecture.png)

### 🧩 Main Components

- **AWS IAM Identity Center:** Centralized identity management, groups, and permission sets.
- **Amazon S3:** Separate team data buckets representing access boundaries.
- **AWS CloudTrail:** Audit logging for relevant management activity and S3 object-level events.
- **Amazon Athena:** SQL-based investigation of CloudTrail records stored in S3.
- **Kali Linux and AWS CLI:** Used with a test identity to validate access and observe the effect of permission changes.
- **Account security controls:** Root-user MFA and budget alerts were configured as foundational safeguards.

### 🪣 Simulated S3 Resources

| Resource | Purpose |
|---|---|
| `nexora-dev-data-684` | Development team data |
| `nexora-finance-data-684` | Restricted Finance data used in the assessment |
| `nexora-hr-data-684` | HR team data boundary |
| `nexora-security-data-684` | Security-related data boundary |
| CloudTrail log bucket | Central storage for audit logs |

These names describe the lab environment. Remove credentials, session tokens, personal information, and other sensitive values from public evidence before publishing.

## 🛠️ 4. Tools and AWS Services

- Amazon Web Services (AWS)
- AWS IAM Identity Center
- Amazon S3
- AWS CloudTrail
- Amazon Athena
- AWS CLI
- Kali Linux
- SQL for audit-log investigation

## 🔬 5. Scenarios and Methodology

### ⚠️ Scenario 1 — Controlled IAM Misconfiguration Assessment

A temporary excessive-permission policy was deliberately assigned to the Developer permission set for a controlled test. This misconfiguration allowed the `dev.alice` test identity to access a Finance S3 object outside its intended authorization scope.

The access attempt was performed from Kali Linux using the AWS CLI. Relevant CloudTrail records were then queried through Athena to investigate the recorded activity.

### ✅ Scenario 2 — Remediation and Post-Remediation Validation

The temporary Finance permissions were removed from the Developer permission set. The test identity was then used to retest access to the Finance bucket.

The subsequent attempt to list the Finance bucket returned an `AccessDenied` response. Authorized Development access was also tested to verify that the intended Development workflow remained available.

### 🔄 Investigation Workflow

1. Configure identity and access controls.
2. Introduce a temporary, intentional permission misconfiguration in the lab.
3. Perform a controlled access test using the test identity.
4. Investigate relevant CloudTrail records with Athena.
5. Remove the excessive permissions.
6. Retest restricted Finance access and validate the result.
7. Document evidence, findings, and recommendations.

## 📊 6. Key Findings and Results

The assessment demonstrated how an excessive permission assignment can weaken access boundaries between teams.

- 🟠 **Before remediation:** The Developer test identity successfully accessed a Finance S3 object while the temporary misconfiguration was active.
- 🔎 **Audit investigation:** CloudTrail records queried through Athena were used to examine the relevant S3 activity.
- 🟢 **After remediation:** A subsequent attempt to list the Finance bucket returned `AccessDenied`.
- 🧪 **Access validation:** Development access was tested separately to confirm that intended access remained available.

The findings are limited to the tested identities, resources, operations, and evidence documented in the lab. The denied listing operation demonstrates enforcement for that tested operation; it does not prove that every possible Finance-related action was tested.

## 🔐 7. Security Recommendations

1. **Apply least privilege:** Grant users and groups only the permissions required for their roles, and review permission sets regularly.
2. **Maintain separate access boundaries:** Keep sensitive Finance, HR, and Security resources isolated from general Development access.
3. **Monitor S3 data events:** Enable appropriate CloudTrail data-event logging for sensitive buckets and review relevant activity.
4. **Investigate unexpected activity:** Use CloudTrail and tools such as Athena to examine unexpected access and repeated authorization failures.
5. **Validate policy changes:** Test both permitted and denied actions after modifying IAM policies or permission sets.
6. **Protect audit records:** Restrict access to CloudTrail log storage and consider suitable integrity and retention controls.
7. **Monitor costs:** Review AWS Budget alerts and remove unused resources when the lab is no longer needed.

Potential future enhancements include automated alerts for unexpected cross-team access, scheduled permission reviews, and more advanced reporting of CloudTrail events. These are recommendations, not features claimed as implemented in this version of the lab.

## 📚 8. Project Documentation

📄 **[View Full Project Report (PDF)](Documentation/CLOUD%20IAM%20PROJECT%20.pdf)**

Explore the complete report covering the lab architecture, IAM configuration, controlled misconfiguration assessment, CloudTrail and Athena investigation, remediation, and validation evidence.


## ⚠️ 9. Disclaimer

This project was developed for educational and portfolio purposes in an AWS environment configured by the author. Testing was limited to the author's lab environment and used test identities, sample resources, and intentionally introduced IAM permission misconfigurations.

The project demonstrates a practical approach to identifying, investigating, and remediating a cloud IAM misconfiguration. It does not represent an external compromise, a production security assessment, or a formal third-party security audit. Findings are based on the tests performed and the evidence collected.

Do not use example policies, commands, or configurations against systems or resources without appropriate authorization. Before publishing supporting evidence, ensure that credentials, session tokens, unnecessary account identifiers, personal information, and other sensitive details have been removed.

## 👨‍💻 10. Author Information

👤 **Author:** Rahul Reghu Rajan  
🎓 **Qualification:** Bachelor of Computer Applications (BCA)  
🏅 **Certification:** Certified Ethical Hacker (CEH V13)

- **LinkedIn:** [Rahul Reghu Rajan](https://www.linkedin.com/in/rahul-reghu-rajan/)
- **Portfolio:** [Rahul's Portfolio](https://rahulhub.vercel.app/)
