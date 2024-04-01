SELECT fr.year AS file_year, AVG(fh.fileSize) AS avg_file_size, COUNT(fh.fileId) as quantity_of_new_files
FROM bigquery-public-data.fcc_political_ads.file_history AS fh
JOIN bigquery-public-data.fcc_political_ads.file_record AS fr 
ON fh.fileId = fr.fileId
WHERE fh.historyStatus = 'new'
GROUP BY file_year
ORDER BY file_year ASC