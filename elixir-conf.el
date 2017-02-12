(defun iex () (interactive) (alchemist-iex-run))

(defun elixir:auto-activate-ruby-end ()
  (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
       "\\(?:^\\|\\s-+\\)\\(?:do\\)")
  (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil))

(defun elixir:config-smartparens ()
  (sp-with-modes '(elixir-mode)
    (sp-local-pair "fn" "end"
                 :when '(("SPC" "RET"))
                 :actions '(insert navigate))
    (sp-local-pair "do" "end"
                   :when '(("SPC" "RET"))
                   ;:post-handlers '(sp-ruby-def-post-handler)
                   :actions '(insert navigate))))

(defun elixir:config-babel ()
  (add-to-list 'org-babel-load-languages '(elixir . t)))

(defun elixir:config-flycheck ()
  (flycheck-mix-setup))

(defun elixir:key (map func)
  (define-key elixir-mode-map (kbd map) func))

(defun elixir:set-key-bindings ()
  (elixir:key "C-c TAB" 'company-complete)
  (elixir:key "C-c d" 'alchemist-help-search-at-point)
  (elixir:key "C-c SPC" 'helm-company))

(defun elixir:one-time-config ()
  (remove-hook 'elixir-mode-hook 'elixir:one-time-config)
  (elixir:auto-activate-ruby-end)
  (elixir:config-smartparens)
  (elixir:set-key-bindings)
  (elixir:config-babel)
  (elixir:config-flycheck))

(defun elixir:hook ()
  (alchemist-mode 1)
  (company-mode 1)
  (ruby-end-mode 1)
  (smartparens-mode 1)
  (flycheck-mode 1)
  (org-mode))

(add-hook 'elixir-mode-hook 'elixir:hook)
(add-hook 'elixir-mode-hook 'elixir:one-time-config)
