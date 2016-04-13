
;; LISP ---------------------
(defun lisp:shared-modes ()
  (paredit-mode t)
  (show-paren-mode 1)
  (projectile-mode 1)
  (hs-minor-mode 1)
  (eldoc-mode t)
  (auto-complete-mode t))

(defun lisp:edit-modes ()
  (prettify-symbols-mode 1)
  (lisp:shared-modes)
  (indent-guide-mode t)
  (highlight-parentheses-mode 1)
  (rainbow-delimiters-mode 1)
  (rainbow-identifiers-mode 1)
  (hl-sexp-mode 1)
  (fci-mode 1))

;; Emacs

(add-hook 'emacs-lisp-mode-hook 'lisp:edit-modes)
(define-key emacs-lisp-mode-map (kbd "C-c TAB") 'auto-complete)
(define-key emacs-lisp-mode-map (kbd "C-c SPC") 'ac-complete-with-helm)

;; COMMON LISP -----------------
(defcustom inferior-lisp-program "sbcl"
  "Set the path to your common lisp implementation"
  :type '(file :must-match t)
  :group 'common-lisp)

(slime-setup '(slime-fancy
               slime-asdf
               slime-banner))
(setq cl:modes-map (list slime-mode-map slime-repl-mode-map lisp-mode-map))

(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"  '(add-to-list 'ac-modes 'slime-repl-mode))


(defun cl:key (map func)
  (let ((map (kbd map)))
    (cl-loop for mode-map in cl:modes-map do
             (define-key mode-map map func))))

(defun cl:edit-mode ()
  (lisp:edit-modes)
  (set-up-slime-ac)
  (slime-mode))

(defun cl:repl-modes ()
  (set-up-slime-ac)
  (lisp:shared-modes))

(add-hook 'lisp-mode-hook 'cl:edit-mode)
(add-hook 'slime-repl-mode-hook 'cl:repl-modes)
(cl:key "C-c d"       #'slime-documentation)
(cl:key "C-c <C-tab>" #'slime-complete-symbol)
(cl:key "C-c C-p"     #'slime-repl-set-package)
(cl:key "C-c M-p"     #'slime-repl-pop-package)
(cl:key "C-c s r"     #'slime-restart-inferior-lisp)
(cl:key "C-c m"       #'slime-macroexpand-1)
(cl:key "C-c M-p"     #'slime-repl-set-package)
(cl:key "M-."         #'slime-edit-definition)
(cl:key "C-c TAB"     #'auto-complete)
(cl:key "C-c SPC"     #'ac-complete-with-helm)

(defun common-lisp-repl ()
  (interactive)
  (slime))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; COMMON LISP - PROJECT RELOADING AND TEST HANDLING
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar common-lisp-last-project nil "Project to send to ASDF")
(defun* common-lisp-asdf-op (&key (load-system nil load?)
                                  (test-system nil test?))
  (let ((cmd (format (if load? "(ql:quickload %s)" "(asdf:test-system %s)")     
                     common-lisp-last-project)))
    (save-some-buffers)
    (slime-repl-send-string cmd )
    (message cmd)))

(defmacro* common-lisp-op-interactive (fname &rest body)
  `(defun ,fname (project)
     (interactive (list (read-string "ASDF Project Name: "
                                     common-lisp-last-project)))
     (setq common-lisp-last-project project)
     ,@body))

(common-lisp-op-interactive common-lisp-load-system
                            (common-lisp-asdf-op :load-system))
(common-lisp-op-interactive common-lisp-test-system
                            (common-lisp-asdf-op :test-system))

(defun* common-lisp-pcwd ()
  (interactive)
  (slime-repl-send-string "(UIOP/OS:GETCWD)"))

(cl:key "C-c l" #'common-lisp-load-system)
(cl:key "C-c t" #'common-lisp-test-system)
(cl:key "C-c s w" #'common-lisp-pcwd)
(cl:key "C-c i" #'slime-inspect)
