(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode)

  :config

  (defun rust::bindings ()
    (local-set-key (kbd "C-c TAB") #'company-complete)
    (local-set-key (kbd "C-c SPC") #'helm-company)
    (local-set-key (kbd "C-c C-k") #'cargo-process-build)
    (local-set-key (kbd "C-c r f") #'cargo-process-fmt)
    (local-set-key (kbd "C-c d") #'racer-describe))

  (defun rust::mode-hook ()
    (rust::bindings)
    (racer-mode 1)
    (cargo-minor-mode 1)
    (eldoc-mode 1)
    (company-mode 1)
    (flycheck-rust-setup)
    (flycheck-mode))

  (add-hook 'rust-mode-hook 'rust::mode-hook))
