; git clone https://github.com/rrrene/bunt
; cd bunt
; mix archive.build
; mix archive.install

; git clone https://github.com/rrrene/credo
; cd credo
; mix archive.build
; mix archive.install

(font-lock-add-keywords
 'elixir-mode
 '(("->\\|::\\|,\\||>\\||" . font-lock-keyword-face)
   ("@\\(\\sw\\|_\\)+" . font-lock-keyword-face)))

(defun iex () (interactive) (alchemist-iex-run))
(defun iex-mix () (interactive) (alchemist-iex-project-run))

(defun elixir:key (map func)
  (define-key elixir-mode-map (kbd map) func)
  (define-key alchemist-mode-map (kbd map) func))

(defun elixir:config-smartparens ()
  (require 'smartparens-elixir))

(defun elixir:config-flycheck ()
  (flycheck-mix-setup)
  (flycheck-credo-setup)
  (flycheck-dialyxir-setup)
  )

(defun elixir:compile ()
  (interactive)
  (let* ((root (file-name-directory (get-closest-pathname "mix.exs")))
         (mix-cmd "mix do compile, dialyzer")
         (cmd (format "cd %s && %s" root mix-cmd)))
    (compile cmd)))

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
  (elixir:key "C-c C-c" 'elixir:compile)
  (elixir:key "C-x C-e" 'alchemist-iex-send-last-sexp)
  (elixir:key "C-c C-z" 'elixir:go-to-iex-buffer)
  (elixir:key "C-c C-t t" 'alchemist-mix-test-at-point)
  (elixir:key "C-c C-t f" 'alchemist-mix-test-this-buffer)
  (elixir:key "C-c C-t a" 'alchemist-mix-test)
  (elixir:key "C-c C-t s" 'alchemist-test-toggle-test-report-display)
  (elixir:key "C-c M-r" 'iex-mix)
  (elixir:key "C-c C-k" 'alchemist-iex-compile-this-buffer)
  (elixir:iex:key "C-c C-o" 'alchemist-iex-clear-buffer)
  (elixir:iex:key "C-c C-z" 'elixir:switch-to-previous-buffer))

(defun elixir:one-time-config ()
  (remove-hook 'elixir-mode-hook 'elixir:one-time-config)
  (elixir:set-key-bindings)
  (elixir:config-smartparens)
  (elixir:config-flycheck))

(defun elixir:hook ()
  (alchemist-mode 1)
  (auto-complete-mode 0)
  (company-mode 1)
  (smartparens-mode 1)
  (indent-guide-mode 1)
  ;(turn-on-smartparens-strict-mode)
  (rainbow-delimiters-mode 1)
  ; (flycheck-mode 0) ;; not geting it work for the moment
  (whitespace-mode 1)
  (yas-minor-mode 1))

(defun elixir:iex:hook ()
  (company-mode 1)
  (rainbow-delimiters-mode 1)
  (rainbow-identifiers-mode 1))

(add-hook 'elixir-mode-hook 'elixir:one-time-config)
(add-hook 'elixir-mode-hook 'elixir:hook)
(add-hook 'alchemist-iex-mode-hook 'elixir:iex:hook)


(defun alchemist-utils-empty-string-p (string)
  "Return non-nil if STRING is null, blank or whitespace only."
  (or (null string)
      (string= string "")))
