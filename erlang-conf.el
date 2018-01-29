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
  (setq erlang-electric-commands '(erlang-electric-comma erlang-electric-semicolon))
  
  (setq erlang-indent-level 2)

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
    (local-set-key (kbd "C-c SPC") #'ac-complete-with-helm)
    (local-set-key (kbd "C-c M-r") #'erlang/open-shell)
    (local-set-key (kbd "C-c C-c") #'makefile-compile)
    (local-set-key (kbd "C-c C-t") #'makefile-test)
    (local-set-key (kbd "C-c d")   #'edts-show-doc-under-point)
    (local-set-key (kbd "C-c e")   #'edts-mode)
    (local-set-key (kbd "M-e")     #'end-of-line))

  (defun setup-erlang-flycheck ()
    (setq-local flycheck-display-errors-function nil)
    (setq-local flycheck-erlang-include-path '("../include" ))
    (setq-local flycheck-erlang-library-path '("../src" "../test"))
    (setq-local flycheck-check-syntax-automatically '(save))
    (flycheck-mode 1)
    (flycheck-popup-tip-mode 1))
  
  (defun erlang-mode-conf ()
    (auto-complete-mode 1)
    (setup-erlang-flycheck)
    (indent-guide-mode 1)
    (smartparens-strict-mode 1)
    (setq-local indent-tabs-mode nil)
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
  ;; wget -c http://erlang.org/download/otp_doc_man_20.2.tar.gz
  ;; mkdir -p ~/.emacs.d/edts/doc/20.2
  ;; tar xzf otp_doc_man_20.2.tar.gz -C  ~/.emacs.d/edts/doc/20.2
  (setq edts-inhibit-package-check t
        edts-man-root "~/.emacs.d/edts/doc/20.2")
  :config
  (defun edts-show-tooltip (x)
    (if x (popup-tip x)  (message "can't find doc")))
  :ensure t)

(use-package neotree
  :config
  (require 'neotree)
  (mapcar (lambda (x) (add-to-list 'neo-hidden-regexp-list x))
          '("\\.beam$"))
  :ensure t)
