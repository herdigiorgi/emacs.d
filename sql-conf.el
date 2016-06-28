(require 'sql)
(require 'sql-indent)

(setq sql-connection-alist
      `((default (sql-product 'postgres)
                 (sql-port 5432)
                 (sql-server ,(getenv "PGHOST"))
                 (sql-user ,(getenv "PGUSER"))
                 (sql-password ,(getenv "PGPASSWORD"))
                 (sql-database ,(getenv "PGDATABASE")))
        (server2 (sql-product 'postgres)
                  (sql-port 5432)
                  (sql-server "localhost")
                  (sql-user "user")
                  (sql-password "password")
                  (sql-database "db2"))))

(defun sql-connect-default ()
  (interactive)
  (let ((product (cadadr (assoc 'sql-product
                                (assoc 'default sql-connection-alist)))))
    (setq sql-product product)    
    (sql-connect 'default)))

(define-key sql-mode-map (kbd "M-q") 'sql-indent-buffer)
