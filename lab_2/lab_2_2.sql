SELECT DATE_TRUNC(DATE(TIMESTAMP_MILLIS(bb.timestamp)), MONTH) AS creation_time, COUNT(bt.transaction_id) AS num_transactions
FROM bigquery-public-data.bitcoin_blockchain.blocks AS bb
JOIN UNNEST(bb.transactions) AS transaction
JOIN bigquery-public-data.bitcoin_blockchain.transactions AS bt
ON transaction.transaction_id = bt.transaction_id
WHERE bt.work_error IS NULL
GROUP BY creation_time
ORDER BY creation_time ASC