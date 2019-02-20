;; pip install --user jedi rope flake8 autopep8 jupyter
(use-package python
  :mode ("\\.py\\'" . python-mode)

  :init
  (elpy-enable)

  :config
  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter")

  (defun my-python-bindings ()
    (local-set-key (kbd "C-c TAB") #'auto-complete)
    (local-set-key (kbd "C-c SPC") #'ac-complete-with-helm)
    (local-set-key (kbd "C-x C-e") #'elpy-shell-send-statement)
    (local-set-key (kbd "C-c r f") #'elpy-format-code)
    (local-set-key (kbd "C-c r r") #'elpy-refactor)
    (local-set-key (kbd "C-c r e") #'elpy-multiedit-python-symbol-at-point)
    (local-unset-key (kbd "C-x C-c")))

  (defun my-python-set-indentation ()
    (setq indent-tabs-mode nil)
    (setq python-indent-guess-indent-offset t)
    (setq python-indent-guess-indent-offset-verbose nil)
    (setq tab-width 4))

  (defun python-mode-conf-hook ()
    (my-python-set-indentation)
    (eval-sexp-fu-flash-mode 1)
    (rainbow-delimiters-mode 1)
    (smartparens-global-strict-mode 1)
    (my-python-bindings))

  (add-hook 'python-mode-hook 'python-mode-conf-hook))
