# Identity and Access Management
Services related to permissions for users, as specific as resource-level access management.
- **principals** are any IAM entity that can either be given access or denied access to some resource or AWS service
- **authentication** is the process of verifying a principal
  - supports user/pass, access key, and access key/session token
  - root users, IAM users, roles/temp tokens
- **authorization** is the process of determining if a principal can perform some action on a resource
  - **policies** determine whether an action by some principal is allowed
  - fields for a policy are: **Effect** (Allow or Deny), **Service**, and **Resource**
  - conditionals can describe parameters that must be true for the policy to hold for a given principal
  - the three parameters together form an **Amazon Resource Name** (ARN)
  - managed policies can apply to multiple users and groups, while user policies grant one-off authorization for some single principal
- **MFA** provides an extra layer of security
- IAM allows two access keys per principal, to allow **key rotations**
- Policy overlap is resolved by prioritizing denies over allows, and defaulting to deny
