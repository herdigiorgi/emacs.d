(load-theme 'monokai t)
(set-background-color "black")
(set-face-background 'fringe "black")
(set-face-background 'mode-line "black")
(set-face-background 'mode-line-inactive "black")
(require 'linum)(set-face-background 'linum "black")
(set-face-bold-p 'bold nil)

(setq visible-bell 1)
(global-hl-line-mode 0)
(set-face-attribute 'default nil :height 90)
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

