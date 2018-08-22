(defun sw:imenu ()
  (setq-local imenu-list-auto-resize nil)
  (setq-local imenu-list-position 'left)
  (imenu-list-minor-mode 1))

(defun sw:mode ()
  (sw:imenu)
  (olivetti-mode 1))

(add-hook 'fountain-mode-hook 'sw:mode)
