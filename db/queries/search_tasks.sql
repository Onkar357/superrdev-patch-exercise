-- H2-compatible task search query
-- Parameters: :term is wrapped in wildcards; :status is NULL for all statuses.
SELECT *
FROM tasks
WHERE archived = FALSE
  AND (LOWER(title) LIKE :term OR LOWER(description) LIKE :term)
  AND (:status IS NULL OR status = :status)
ORDER BY created_at DESC;
