# Batch Processing
Is an efficient way of processing high volumes of data where a group of transactions is collected over a period of time. Data is collected and the processed in batches, returning a batch result (Hadoop is focused on batch data processing). It recieves arriving data, combines it with historical data and recomputes results by iterating over the entire combined data set.

Batch layer operates on the entire data set, yielding the most accurate results. Results come at the cost of high latency due to high computation time.

# Real Time Data Processing
Involves continual input, process and data output (Radar systems, bank ATMs). Allows the ability to take immediate action when low latency matters.
- Complex event processing (CEP) combines data from various sources to detect patterns
- Operational Intelligence (OI) uses real-time data processing and CEP to anaylze operations, running query analysis against live feeds and event data.
- Low Latency Messageing and Event Processing

[source](http://www.datasciencecentral.com/profiles/blogs/batch-vs-real-time-data-processing)
