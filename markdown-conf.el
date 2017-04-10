(defun markdown:hook ()
  (whitespace-mode -1)
  (flyspell-mode 1))

(add-hook 'markdown-mode-hook 'markdown:hook)
