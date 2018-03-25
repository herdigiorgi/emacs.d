(defun my-insert-after-point (text) (save-excursion (insert text))(forward-char))
(defun my-insert-after-point (text) (insert text))
(defun my-insert-grave-accent () (interactive) (my-insert-after-point "`"))
(defun my-insert-tilde () (interactive) (my-insert-after-point "~"))
(defun my-interpunct () (interactive) (my-insert-after-point "·"))
(defun my-back-slash () (interactive) (my-insert-after-point "\\"))


(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c s f") 'helm-do-ag-this-file)
(global-set-key (kbd "C-c s d") 'helm-do-ag)
(global-set-key (kbd "M-x") 'helm-M-x)

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
(global-set-key (kbd "C-+") 'default-text-scale-increase)
(global-set-key (kbd "C--") 'default-text-scale-decrease)

(global-set-key (kbd "C-c h a")   #'origami-toggle-all-nodes)
(global-set-key (kbd "C-c h b") #'origami-recursively-toggle-node)

(global-set-key (kbd "C-c g s") 'magit-status)
(global-set-key (kbd "C-c g m") 'smerge-keep-mine)
(global-set-key (kbd "C-c g o") 'smerge-keep-other)
(global-set-key (kbd "M-6") (kbd "<"))
(global-set-key (kbd "M-7") (kbd ">"))
(global-set-key (kbd "C-M-o") (kbd "["))
(global-set-key (kbd "C-M-p") (kbd "]"))
(global-set-key (kbd "M-8") (kbd "{"))
(global-set-key (kbd "M-9") (kbd "}"))
(global-set-key (kbd "M-1") 'goto-workspace-1)
(global-set-key (kbd "M-2") 'goto-workspace-2)
(global-set-key (kbd "M-3") 'goto-workspace-3)
(global-set-key (kbd "M-4") 'goto-workspace-4)
(global-set-key (kbd "M-5") 'goto-workspace-5)
(global-set-key (kbd "M-6") 'goto-workspace-6)
(global-set-key (kbd "M-7") 'goto-workspace-7)
(global-set-key (kbd "M-8") 'goto-workspace-8)
(global-set-key (kbd "M-9") 'goto-workspace-9)
(global-set-key (kbd "M-0") 'goto-workspace-10)

;When you have an active region that spans multiple lines,
;the following will add a cursor to each line:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;When you want to add multiple cursors not based on continuous
;lines, but based on keywords in the buffer, use:
(global-set-key (kbd "C-M-w") 'mc/mark-next-like-this)
(global-set-key (kbd "C-M-q") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)

(global-set-key [f2]  'helm-recentf)

(global-set-key (kbd "<C-f1>") 'visual-line-mode)
(global-set-key (kbd "<C-f2>") 'linum-mode)
(global-set-key (kbd "C-c M-l") 'slime)

(global-set-key (kbd "C-c p p") #'helm-projectile-switch-project)
(global-set-key (kbd "C-c p f") #'helm-projectile-find-file)
(global-set-key (kbd "C-x C-b") #'helm-mini)

(global-set-key (kbd "C-c s c d") 'sql-connect-default)

(global-set-key (kbd "C-0") 'neotree-toggle)
(global-set-key (kbd "C-1") 'toggle-show-visual)
(global-set-key (kbd "<f1>") 'centered-window-mode)

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
