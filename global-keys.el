(defun my-insert-after-point (text) (save-excursion (insert text))(forward-char))
(defun my-insert-grave-accent () (interactive) (my-insert-after-point "`"))
(defun my-insert-tilde () (interactive) (my-insert-after-point "~"))
(defun my-interpunct () (interactive) (my-insert-after-point "·"))
(defun my-< () (interactive) (my-insert-after-point "<"))
(defun my-> () (interactive) (my-insert-after-point ">"))
(defun my-box-brackets-right () (interactive) (my-insert-after-point "]"))
(defun my-box-brackets-left () (interactive) (my-insert-after-point "["))
(defun my-curly-brackets-left () (interactive) (my-insert-after-point "{"))
(defun my-curly-brackets-right () (interactive) (my-insert-after-point "}"))
(defun my-back-slash () (interactive) (my-insert-after-point "\\"))

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

(global-set-key (kbd "C-c h t")   #'vimish-fold-toggle-all)
(global-set-key (kbd "C-c h h a") #'vimish-fold-refold-all)
(global-set-key (kbd "C-c h s a") #'vimish-fold-unfold-all)
(global-set-key (kbd "C-c h s b") #'vimish-fold-unfold)
(global-set-key (kbd "C-c h h b") #'vimish-fold)
(global-set-key (kbd "C-c h d b") #'vimish-fold-delete)
(global-set-key (kbd "C-c h d a") #'vimish-fold-delete-all)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-M-8") 'my-<)
(global-set-key (kbd "C-M-9") 'my->)
(global-set-key (kbd "M-0") 'my-box-brackets-left)
(global-set-key (kbd "M-'") 'my-box-brackets-right)
(global-set-key (kbd "M-8") 'my-curly-brackets-left)
(global-set-key (kbd "M-9") 'my-curly-brackets-right)

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
(global-set-key (kbd "C-c b l") #'helm-buffers-list)

(global-set-key (kbd "C-c s c d") 'sql-connect-default)

(global-set-key (kbd "<f12>") 'neotree-toggle)
(global-set-key (kbd "<f3>") 'centered-window-mode)




