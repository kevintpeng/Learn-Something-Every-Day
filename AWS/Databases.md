# Databases through RDS and Redshift
Data stores can be deployed on EC2, but may require extensive configuration to meet availability or performance needs
- **Amazon RDS** wraps over 6 different RDBMS engines
  - MySQL, PostgreSQL, MariaDB, and others
  - recall that relational databases can be categorized as OLTP (transaction) and OLAP (analytical)
  - handles vertical and horizontal scaling, possibly over multiple availability zones
  - handles backups, restoration, patching, security through IAM
- **Amazon Redshift** is a fully managed relational database for OLAP scenarios for data warehousing
  - based on PostgreSQL
- Redshift is a cluster, containing possibly many databases
- **Amazon DynamoDB** is a fully managed NoSQL database
  - designed for high scalability
  - tables require a primary key, but no schema required
  - Data types are categorized as either scalar, set or document
  - scaler: string, number, binary, bool, null
  - set: string set, number set, binary set
  - document: list, map
  - notice this design pulls from lots of other NoSQL DB designs
  - **DynamoDB Streams** expose data for the purpose of tracking changes for processing and monitoring
