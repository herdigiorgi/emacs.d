(load-theme 'monokai t)

(setq visible-bell 1)
(global-hl-line-mode 0)
(set-default-font "monofur")
(set-face-attribute 'default nil :height 110)
(setq ring-bell-function 'ignore)

; Remove any bars... only text
(scroll-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;(defun remove-all-bars-after-make-frame (f) (remove-all-bars))
;(add-hook 'server-visit-hook 'remove-all-bars)
;(add-hook 'after-make-frame-functions 'remove-all-bars-after-make-frame)
;(remove-all-bars)

;; SCROLL
(yascroll-bar-mode 1)

;;nyan
(nyan-mode 1)
(nyan-start-animation)
(setq nyan-wavy-trail t)
(setq nyan-bar-length 10)


;fci
(setq whitespace-display-mappings
      '( (space-mark   ?\     [?·]     [?.])		; space - middle dot
         (space-mark   ?\xA0  [?¤]     [?_])		; hard space - currency sign
         ;; NEWLINE is displayed using the face `whitespace-newline'
         ;(newline-mark ?\n    [?$ ?\n])			; eol - dollar sign
         ;; (newline-mark ?\n    [?↵ ?\n] [?$ ?\n])	; eol - downwards arrow
         (newline-mark ?\n    [?¶ ?\n] [?$ ?\n])	; eol - pilcrow
         ;; (newline-mark ?\n    [?¯ ?\n]  [?$ ?\n])	; eol - overscore
         ;; (newline-mark ?\n    [?¬ ?\n]  [?$ ?\n])	; eol - negation
         ;; (newline-mark ?\n    [?° ?\n]  [?$ ?\n])	; eol - degrees
         ;;
         ;; WARNING: the mapping below has a problem.
         ;; When a TAB occupies exactly one column, it will display the
         ;; character ?\xBB at that column followed by a TAB which goes to
         ;; the next TAB column.
         ;; If this is a problem for you, please, comment the line below.
         (tab-mark     ?\t    [?» ?\t] [?\\ ?\t])	; tab - right guillemet
         ))
(global-whitespace-mode 1)
