; smarparens
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))

(defun html:web-mode-config ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-engines-alist
        '(("php"  . "\\.phtml\\'")
          ("erb"  . "\\.eex'."))))

(defun html:key (map fun)
  (define-key web-mode-map (kbd map) fun))

(defun html:config-keys ()
  (html:key "C-<right>" 'tagedit-forward-slurp-tag)
  (html:key "C-<left>" 'tagedit-forward-barf-tag)
  (html:key "M-s" 'tagedit-splice-tag)
  (html:key "M-p" 'te/goto-tag-begging)
  (html:key "M-n" 'te/goto-tag-end)
  (html:key "C-c TAB" 'auto-complete))

(defun html:ac-config ()
  (setq web-mode-ac-sources-alist
        '(("css" . (ac-source-css-property))
          ("html" . (ac-source-words-in-buffer ac-source-abbrev)))))

(defun html:one-time-config ()
  (remove-hook 'web-mode-hook 'html-one-time-config)
  (html:config-keys)
  (html:web-mode-config)
  (html:ac-config))

(defun html:hook ()
  (auto-complete-mode 1))

(add-hook 'web-mode-hook 'html:one-time-config)
(add-hook 'web-mode-hook 'html:hook)
