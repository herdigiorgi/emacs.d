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

(defun elixir:config-flycheck ()
  (flycheck-mix-setup))

(defun elixir:key (map func)
  (define-key elixir-mode-map (kbd map) func))

(defun elixir:iex:key (map func)
  (define-key alchemist-iex-mode-map (kbd map) func))

(defun elixir:go-to-iex-buffer ()
  (interactive)
  (switch-to-buffer-other-frame "*Alchemist-IEx*"))

(defun elixir:switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer-other-frame (other-buffer (current-buffer) 1)))

(defun elixir:set-key-bindings ()
  (elixir:key "C-c TAB" 'company-complete)
  (elixir:key "C-c d" 'alchemist-help-search-at-point)
  (elixir:key "C-c SPC" 'helm-company)
  (elixir:key "C-x C-e" 'alchemist-iex-send-last-sexp)
  (elixir:key "C-c C-z" 'elixir:go-to-iex-buffer)
  (elixir:iex:key "C-c C-o" 'alchemist-iex-clear-buffer)
  (elixir:iex:key "C-c C-z" 'elixir:switch-to-previous-buffer))

(defun elixir:one-time-config ()
  (remove-hook 'elixir-mode-hook 'elixir:one-time-config)
  (elixir:auto-activate-ruby-end)
  (elixir:config-smartparens)
  (elixir:set-key-bindings)
  (elixir:config-flycheck))

(defun elixir:hook ()
  (alchemist-mode 1)
  (company-mode 1)
  (ruby-end-mode 1)
  (smartparens-mode 1)
  (flycheck-mode 1))

(add-hook 'elixir-mode-hook 'elixir:hook)
(add-hook 'elixir-mode-hook 'elixir:one-time-config)
