(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; Path
(setq exec-path (append exec-path '("/usr/texbin" "/usr/local/bin")))

(put 'erase-buffer 'disabled nil)
(setq inhibit-startup-screen t)

;; AUTOSAVE
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(ido-mode 1)

;; revert
(global-auto-revert-mode t)

;recentf
(recentf-mode)

; helm projectile
(helm-projectile-on)
(setq projectile-indexing-method 'alien)

;non intrusive flycheck
(setq flycheck-check-syntax-automatically '(save))

;smatparens
(require 'smartparens-config)

;;origami
(add-hook 'prog-mode-hook (lambda () (origami-mode 1)))

;yas
(require 'yasnippet)
(yas-reload-all)

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

(defun set-closest-makefile (command)
  (let* ((makefile-path (get-closest-pathname))
         (makefile-dir (file-name-directory makefile-path))
         (command (or command "")))
    (set (make-local-variable 'compile-command)
         (format "cd %s && make -f %s %s" makefile-dir makefile-path command))))

(defun makefile-compile ()
  (interactive)
  (set-closest-makefile "compile")
  (compile compile-command))

(defun makefile-test ()
  (interactive)
  (set-closest-makefile "test")
  (compile compile-command))

;; Compile
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;;

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

;; edif
(custom-set-variables
 '(ediff-window-setup-function (quote ediff-setup-windows-plain)))

;; centered
(setq cwm-centered-window-width 80)

;; semantic
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
