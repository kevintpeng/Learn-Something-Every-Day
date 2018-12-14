# [2018 Formal reasoning aout the security of AWS](http://www0.cs.ucl.ac.uk/staff/b.cook/CAV18_invited.pdf)
- report on the development and use of formal verification in AWS, for the purpose of security

### Problem:
- AWS offers cloud-computing services
  - security is important to them and their customers, they run critical infrastructure for software companies worldwide
  - they require strict security standards, both for the purpose of customer needs and to satisfy global regulations imposed by various governments

### Solution:
- formal verification is used to ensure that the implementation of AWS adheres to the intended design, and all invariants hold throughout execution (checked by continuously running formal verification)
- use deductive theorem proving and symbolic model checking types of formal reasoning
  - this is through the use of predicate logic and complex theorem proving software
- customers are given a suite of security offerings from AWS, to analyze their cloud environment for potential application-level security vulnerabilities
  - again, formal verification is important in heavily regulated industries, or companies dealing with highly sensitive data, and require confidence that their assumptions are not violated

### Issues:
Implementation challenges are discussed. Some that were interesting to me:
- distributed formal verification tackles the non-functional requirement of scaling the system
  - at AWS scale, there are few other large scale systems performing formal verification
  - further development is required in this area, to meet their formal verification needs
- continuous formal verification is how this fits into software architecture of a software system, and how to integrate it
  - challenges here are in regards to the non-functional requirement of maintainability, proofs are like code and need to be documented and maintained.
  - old/irrelevant proofs might not need to be checked
  - some proofs can be unreasonable as invariants and should not be checked

### My thoughts
As a service that needs to deal with such sensitive data, it makes a lot of sense to be applying ideas from academia to acheive more quality in their services. Security is a vital consideration for AWS, in order to maintain customer trust. The recent changes with GDPR and other foreign data regulations like MiFID ii are very compelling reasons for companies to be moving towards formal verification of their software. Unfortunately, a lot of companies don't have the resources or time to focus on the formal verification aspect of software analysis. Perhaps as more data regulations unfold, this may become more and more of a requirement for software companies.
