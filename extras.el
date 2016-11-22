(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(put 'erase-buffer 'disabled nil)
;; AUTOSAVE
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(ido-mode 1)

;;;
;;; Find closest makefile
;;;
(setq compilation-scroll-output t)
(defun* get-closest-pathname (&optional (file "Makefile"))
  "Determine the pathname of the first instance of FILE starting from the 
   current directory towards root. This may not do the correct thing in 
   presence of links. If it does not find FILE, then it shall return the name
   of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (expand-file-name file
		      (loop 
			for d = default-directory then (expand-file-name ".." d)
			if (file-exists-p (expand-file-name file d))
			return d
			if (equal d root)
			return nil))))

(defun set-closest-makefile ()
  (let* ((makefile-path (get-closest-pathname))
         (makefile-dir (file-name-directory makefile-path)))
    (set (make-local-variable 'compile-command)
         (format "cd %s && make -f %s" makefile-dir makefile-path))))
