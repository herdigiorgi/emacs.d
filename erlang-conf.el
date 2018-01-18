(use-package erlang
  :init
  (add-to-list 'auto-mode-alist '("\\.P\\'" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.E\\'" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.S\\'" . erlang-mode))
  (add-to-list 'auto-mode-alist '("rebar\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("relx\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("system\\.config$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.app\\.src$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.erl?$" . erlang-mode))
  (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))

  (add-hook 'after-init-hook 'erlang/after-init-hook)
  (defun erlang/after-init-hook ()
    (require 'edts-start))

  (defun erlang/open-shell ()
    (interactive)
    (if (not (get-buffer "*edts[0]*"))  (edts-shell))
    (switch-to-buffer-other-window  "*edts[0]*"))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  :config
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (setq flycheck-erlang-include-path '("../include" "../deps"))

  (require 'ivy-erlang-complete)
  
  (defun fix-erlang-project-includes (project-root)
    "Find erlang include paths for PROJECT-ROOT with project deps."
    (setq-local flycheck-erlang-include-path
                (append
                 (s-split
                  "\n"
                  (shell-command-to-string
                   (concat "find "
                           project-root
                           "/*"
                           " -type d -name include"))
                  t)
                 (list project-root
                       (concat project-root "/include")
                       (concat project-root "/deps")
                       default-directory
                       (concat
                        (locate-dominating-file
                         default-directory
                         "src") "include")
                       (concat
                        (locate-dominating-file
                         default-directory
                         "src") "deps")))))

  (defun fix-erlang-project-code-path (project-root)
    "Find erlang include paths for PROJECT-ROOT with project deps."
    (let ((code-path
           (split-string (shell-command-to-string
                          (concat "find " project-root " -type d -name ebin")))
           ))
      (setq-local flycheck-erlang-library-path code-path)))

  (defun setup-ivy-erlang-complete ()
    "Setup for erlang."
    (let ((project-root (ivy-erlang-complete-autosetup-project-root)))
      (fix-erlang-project-code-path project-root)
      (fix-erlang-project-includes project-root))
    (ivy-erlang-complete-init))


  (defun bindings ()
    (local-set-key (kbd "C-c TAB") #'auto-complete)
    (local-set-key (kbd "C-c M-r") #'erlang/open-shell))

   
  (defun erlang-mode-conf ()
    (auto-complete-mode 1)
    (rainbow-delimiters-mode 1)
    (rainbow-identifiers-mode 1)
    (flycheck-mode 1)
    (flycheck-popup-tip-mode 1)
    (indent-guide-mode 1)
    (smartparens-strict-mode 1)
    (edts-mode 1)
    (setq indent-tabs-mode nil)
    (bindings))
  
  (defun erlang-shell-mode-conf ()
    (bindings))
  
  (add-hook 'erlang-mode-hook (lambda () (run-hooks 'prog-mode-hook)))
  (add-hook 'erlang-mode-hook #'erlang-mode-conf)
  (add-hook 'erlang-shell-mode-hook #'erlang-shell-mode-conf)
  (add-hook 'edts-shell-mode-hook #'erlang-shell-mode-conf)
  

  
   :mode
   ("\\.erl\\'" . erlang-mode)
   ("\\.hrl\\'" . erlang-mode)
   :ensure t)


(use-package edts
  :init
  (setq edts-inhibit-package-check t
        edts-man-root "~/.emacs.d/edts/doc/18.2.1")
  :ensure t)

(use-package flycheck
  :diminish flycheck-mode
  :config
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function nil
        flycheck-erlang-include-path '("../include")
        flycheck-erlang-library-path '()
        flycheck-check-syntax-automatically '(save))
  :ensure t)
