(use-package scala-mode
  :init
  (setq ensime-startup-notification nil)
  (setq ensime-eldoc-hints 'all)
  (setq ensime-search-interface 'helm)

  (defun bindings ()
    (local-set-key (kbd "C-c TAB") #'company-complete)
    (local-set-key (kbd "C-c SPC") #'helm-company)
    (local-set-key (kbd "C-c d") #'ensime-show-doc-for-symbol-at-point)
    (local-set-key (kbd "C-c t") #'ensime-type-at-point)
    (local-set-key (kbd "C-c T") #'ensime-type-at-point-full-name))

  (defun scala-mode-conf ()
    (auto-complete-mode 1)
    (smartparens-strict-mode 1)
    (bindings))

  (add-hook 'scala-mode-hook #'scala-mode-conf)

  :mode
  ("\\.scala\\'" . scala-mode)
  ("\\.sbt\\'" . scala-mode)
)
