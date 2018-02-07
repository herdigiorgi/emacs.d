(use-package conf-mode
  :init
  (add-to-list 'auto-mode-alist '("config$" . conf-mode))

  :config
 
  (defun conf-mode/hook ()
    (indent-guide-mode 1)
    (electric-indent-mode 0))

  (add-hook 'conf-space-mode-hook #'conf-mode/hook)
)

(use-package dockerfile-mode
  :config
  (defun dockerfile-mode/hook ()
    (electric-indent-mode 0))

  (add-hook 'dockerfile-mode/hook #'dockerfile-mode/hook))
