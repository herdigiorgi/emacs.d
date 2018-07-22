(use-package erlang
  :init
  (add-to-list 'auto-mode-alist '("\\.P\\'" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.E\\'" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.S\\'" . erlang-mode))
  (add-to-list 'auto-mode-alist '("rebar\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("relx\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("system\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("rebar\\.lock$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.app\\.src$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

  (setq load-path (cons "~/.kerl/20.3/lib/tools-2.11.2/emacs" load-path))
  (setq ivy-erlang-complete-erlang-root "~/.kerl/20.3")
  (setq erlang-root-dir "~/.kerl/20.3")
  (setq exec-path (cons "~/.kerl/20.3/bin" exec-path))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  :config
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq erlang-electric-commands
        '(erlang-electric-comma erlang-electric-semicolon))
  (add-hook 'erlang-mode-hook #'ivy-erlang-complete-init)
  (add-hook 'after-save-hook #'ivy-erlang-complete-reparse)
  (setq erlang-indent-level 2)

  (defun setup-erlang-flycheck ()
    (setq-local flycheck-display-errors-function nil)
    (setq-local flycheck-erlang-include-path '("../include" ))
    (setq-local flycheck-erlang-library-path '("../src" "../test"))
    (setq-local flycheck-check-syntax-automatically '(save))
    (setq erlang-root-dir "~/.kerl/20.3/")
    (flycheck-rebar3-setup)
    (flycheck-mode 1)
    (flycheck-popup-tip-mode 1))

  (defun bindings ()
    (setq ivy-erlang-complete-use-default-keys nil)

    (local-set-key (kbd "C-c TAB") #'ivy-erlang-complete)
    (local-set-key (kbd "M-.") #'xref-find-definitions)
    (local-set-key (kbd "M-,") #'xref-pop-marker-stack)
    (local-set-key (kbd "C-c SPC") #'ac-complete-with-helm)
    (local-set-key (kbd "C-c M-r") #'erlang/open-shell)
    (local-set-key (kbd "C-c C-c") #'makefile-compile)
    (local-set-key (kbd "C-c C-t") #'makefile-test)
    (local-set-key (kbd "C-c d")   #'edts-show-doc-under-point)
    (local-set-key (kbd "M-e") #'end-of-line))

  (defun erlang-mode-conf ()
    (auto-complete-mode 1)
    (smartparens-strict-mode 1)
    (setq-local indent-tabs-mode nil)
    (setup-erlang-flycheck)
    (ivy-erlang-complete-init)
    (bindings))

  (add-hook 'erlang-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
  (add-hook 'erlang-mode-hook #'erlang-mode-conf)

  :mode
  ("\\.erl\\'" . erlang-mode)
  ("\\.hrl\\'" . erlang-mode)
  :ensure t)


(use-package neotree
  :config
  (require 'neotree)
  (mapcar (lambda (x) (add-to-list 'neo-hidden-regexp-list x))
          '("\\.beam$"))
  :ensure t)
