(defun js/js-setup ()
  (setq js3-auto-indent-p t
        js3-curly-indent-offset 0
        js3-enter-indents-newline t
        js3-expr-indent-offset 2
        js3-indent-on-enter-key t
        js3-lazy-commas t
        js3-lazy-dots t
        js3-lazy-operators t
        js3-paren-indent-offset 2
        js3-square-indent-offset 4)
  (auto-complete-mode 1)
  (electric-pair-mode 1)
  (rainbow-delimiters-mode 1)
  (rainbow-identifiers-mode 1)
  (add-to-list 'ac-modes 'js3-mode))


(add-hook 'js3-mode-hook #'js/js-setup)
