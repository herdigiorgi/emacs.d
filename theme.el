(load-theme 'dracula t)
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-default-font "Monoid" nil t)
;(set-face-bold-p 'bold nil)

(setq visible-bell 1)
(global-hl-line-mode 0)
(set-face-attribute 'default nil :height 90 :weight 'regular)
(setq ring-bell-function 'ignore)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

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

