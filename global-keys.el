(defun my-insert-after-point (text) (save-excursion (insert text))(forward-char))
(defun my-insert-after-point (text) (insert text))
(defun my-insert-grave-accent () (interactive) (my-insert-after-point "`"))
(defun my-insert-tilde () (interactive) (my-insert-after-point "~"))
(defun my-interpunct () (interactive) (my-insert-after-point "·"))
(defun my-back-slash () (interactive) (my-insert-after-point "\\"))
(defun my-show-more-visual ()
  (interactive)
  (let* ((activated (bound-and-true-p linum-mode))
         (toggle (or (and activated 0) 1)))
    (linum-mode toggle)
    (whitespace-mode toggle)))

(global-set-key (kbd "C-$") 'my-insert-tilde)
(global-set-key (kbd "C-t") 'my-insert-grave-accent)
(global-set-key (kbd "C-#") 'my-interpunct)
(global-set-key (kbd "C-M-'") 'my-back-slash)
(global-set-key (kbd "C-c C-b")     'windmove-left)
(global-set-key (kbd "C-c <left>")     'windmove-left)
(global-set-key (kbd "C-c C-f") 'windmove-right)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c C-p")    'windmove-up)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c C-n")  'windmove-down)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <C-right>") 'other-frame)
(global-set-key (kbd "C-c <C-left>")  'other-frame)
(global-set-key (kbd "C-x SPC") 'just-one-space)
(global-set-key (kbd "C-c v") 'highlight-symbol)

(global-set-key (kbd "C-c h t")   #'vimish-fold-toggle-all)
(global-set-key (kbd "C-c h h a") #'vimish-fold-refold-all)
(global-set-key (kbd "C-c h s a") #'vimish-fold-unfold-all)
(global-set-key (kbd "C-c h s b") #'vimish-fold-unfold)
(global-set-key (kbd "C-c h h b") #'vimish-fold)
(global-set-key (kbd "C-c h d b") #'vimish-fold-delete)
(global-set-key (kbd "C-c h d a") #'vimish-fold-delete-all)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "M-6") (kbd "<"))
(global-set-key (kbd "M-7") (kbd ">"))
(global-set-key (kbd "C-M-o") (kbd "["))
(global-set-key (kbd "C-M-p") (kbd "]"))
(global-set-key (kbd "M-8") (kbd "{"))
(global-set-key (kbd "M-9") (kbd "}"))

;When you have an active region that spans multiple lines,
;the following will add a cursor to each line:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;When you want to add multiple cursors not based on continuous
;lines, but based on keywords in the buffer, use:
(global-set-key (kbd "C-M-w") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-q") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

(global-set-key [f2]  'recentf-open-files)

(global-set-key (kbd "<C-f1>") 'visual-line-mode)
(global-set-key (kbd "<C-f2>") 'linum-mode)
(global-set-key (kbd "C-c M-l") 'slime)

(global-set-key (kbd "C-c p p") #'helm-projectile-switch-project)
(global-set-key (kbd "C-c p f") #'helm-projectile-find-file)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)

(global-set-key (kbd "C-c s c d") 'sql-connect-default)

(global-set-key (kbd "<f12>") 'neotree-toggle)
(global-set-key (kbd "<f3>") 'centered-window-mode)
(global-set-key (kbd "<f1>") 'my-show-more-visual)


;;
;; Smartparens
;;
(eval-after-load 'smartparens
  '(progn
     (define-key smartparens-mode-map (kbd "C-M-f") 'sp-forward-sexp)
     (define-key smartparens-mode-map (kbd "C-M-b") 'sp-backward-sexp)

     (define-key smartparens-mode-map (kbd "C-M-d") 'sp-down-sexp)
     (define-key smartparens-mode-map (kbd "C-M-a") 'sp-backward-down-sexp)
     (define-key smartparens-mode-map (kbd "C-S-d") 'sp-beginning-of-sexp)
     (define-key smartparens-mode-map (kbd "C-S-a") 'sp-end-of-sexp)

     (define-key smartparens-mode-map (kbd "C-M-e") 'sp-up-sexp)
     (define-key smartparens-mode-map (kbd "C-M-u") 'sp-backward-up-sexp)
     (define-key smartparens-mode-map (kbd "C-M-t") 'sp-transpose-sexp)
     
     (define-key smartparens-mode-map (kbd "C-M-n") 'sp-next-sexp)
     (define-key smartparens-mode-map (kbd "C-M-p") 'sp-previous-sexp)
     
     (define-key smartparens-mode-map (kbd "C-M-k") 'sp-kill-sexp)
     (define-key smartparens-mode-map (kbd "C-M-c") 'sp-copy-sexp)
     
     (define-key smartparens-mode-map (kbd "M-<delete>") 'sp-unwrap-sexp)
     (define-key smartparens-mode-map (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

     (define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
     (define-key smartparens-mode-map (kbd "C-<left>") 'sp-forward-barf-sexp)
     (define-key smartparens-mode-map (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
     (define-key smartparens-mode-map (kbd "C-M-<right>") 'sp-backward-barf-sexp)
     
     (define-key smartparens-mode-map (kbd "M-D") 'sp-splice-sexp)
     (define-key smartparens-mode-map (kbd "C-M-<delete>")
       'sp-splice-sexp-killing-forward)
     (define-key smartparens-mode-map (kbd "C-M-<backspace>")
       'sp-splice-sexp-killing-backward)
     (define-key smartparens-mode-map (kbd "C-S-<backspace>")
       'sp-splice-sexp-killing-around)

     (define-key smartparens-mode-map (kbd "C-]") 'sp-select-next-thing-exchange)
     (define-key smartparens-mode-map (kbd "C-<left_bracket>")
       'sp-select-previous-thing)
     (define-key smartparens-mode-map (kbd "C-M-]") 'sp-select-next-thing)
     
     (define-key smartparens-mode-map (kbd "M-F") 'sp-forward-symbol)
     (define-key smartparens-mode-map (kbd "M-B") 'sp-backward-symbol)))
