(autoload 'fsharp-mode "fsharp-mode"     "Major mode for editing F# code." t)
(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))

(defun fsharp:key (key f)
  (define-key fsharp-mode-map (kbd key) f))

(defun fsharp:compile ()
  (interactive)
  (compile "make"))

(defun fsharp:mode ()
  (fci-mode 1)
  (projectile-mode 1)
  (paredit-mode 1)
  (hs-minor-mode 1)
  (indent-guide-mode 1)
  (rainbow-blocks-mode 1)
  (rainbow-identifiers-mode 1)
  
  (fsharp:key "C-c TAB" 'fsharp-ac/complete-at-point)
  (fsharp:key "C-c SPC" 'helm-company)
  (fsharp:key "C-c C-k" 'fsharp:compile))

(add-hook 'fsharp-mode-hook 'fsharp:mode)
