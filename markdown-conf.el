(defun markdown:hook ()
  (whitespace-mode -1)
  (flyspell-mode 1)
  (define-key markdown-mode-map (kbd "C-c <left>") nil)
  (define-key markdown-mode-map (kbd "C-c <right>") nil)
  (define-key markdown-mode-map (kbd "C-c <up>") nil)
  (define-key markdown-mode-map (kbd "C-c <down>") nil))

(add-hook 'markdown-mode-hook 'markdown:hook)
