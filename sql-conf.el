(eval-after-load "sql"
      (load-library "sql-indent"))

(define-key sql-mode-map (kbd "M-q") 'sql-indent-buffer)
