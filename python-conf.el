;; pip install jedi rope flake8 autopep8 jupyter virtualenv
(use-package elpy
  :mode ("\\.py\\'" . python-mode)

  :init
  (setq python-shell-interpreter "python3")
  (elpy-enable)
  (require 'realgud)
  (load "elpy")

  (load "elpy-shell")
  (load "elpy-profile")
  (load "elpy-refactor")
  (load "elpy-django")

  :config
  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter")
  (setq pipenv-with-flycheck nil)
  (setq pipenv-with-projectile nil)

  (defun python-debugger()
    (interactive)
    (realgud:pdb))

  (defun my-python-bindings ()
    (local-set-key (kbd "C-c TAB") #'auto-complete)
    (local-set-key (kbd "C-c SPC") #'ac-complete-with-helm)
    (local-set-key (kbd "C-x C-e") #'elpy-shell-send-statement)
    (local-set-key (kbd "C-c r f") #'elpy-format-code)
    (local-set-key (kbd "C-c r r") #'elpy-refactor)
    (local-set-key (kbd "C-c r e") #'elpy-multiedit-python-symbol-at-point)
    (local-set-key (kbd "<return>") #'newline-and-indent)
    (local-unset-key (kbd "C-x C-c"))
    (define-key elpy-mode-map (kbd "<C-return>") nil))

  (defun my-python-set-indentation ()
    (setq indent-tabs-mode nil)
    (setq python-indent-guess-indent-offset t)
    (setq python-indent-guess-indent-offset-verbose nil)
    (setq tab-width 4))

  (defun my-python-setup-completion()
    (jedi:setup)
    (jedi:ac-setup)
    (jedi-mode 1)
    (auto-complete-mode 1))

  (defun python-mode-conf-hook ()
    (pipenv-mode 1)
    (flycheck-mode 1)
    (fci-mode 1)
    (my-python-set-indentation)
    (my-python-setup-completion)
    (eval-sexp-fu-flash-mode 1)
    (rainbow-delimiters-mode 1)
    (smartparens-global-strict-mode 1)
    (my-python-bindings))

  (add-hook 'elpy-mode-hook 'python-mode-conf-hook))
