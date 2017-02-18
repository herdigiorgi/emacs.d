(load-theme 'junio t)

(setq visible-bell 1)
(global-hl-line-mode 1)
(set-face-attribute 'default nil :height 100)
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

