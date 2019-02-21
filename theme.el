;; modeline
(size-indication-mode 0)
(column-number-mode 0)
(line-number-mode 0)
(setq sml/theme 'light
      sml/no-confirm-load-theme t)
(sml/setup)
(which-function-mode 1)
(setq which-func-unknown "∅")

;; color theme
(load-theme 'leuven t)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-default-font "IBM Plex Mono" nil t)
;(set-face-bold-p 'bold nil)

(setq visible-bell 1)
(global-hl-line-mode 0)
(set-face-attribute 'default nil :height 100 :weight 'regular)
(setq ring-bell-function 'ignore)
;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-window-fixed-size nil)
(setq neo-smart-open t)

(setq fci-rule-width 1)
(setq fci-rule-color "#DDDDDD")

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

;; whitespace
(require 'whitespace)
(delete 'lines whitespace-style)
(delete 'empty whitespace-style)
(defun show-visuals (activate)
  (linum-mode activate)
  (whitespace-mode activate))
(defun is-show-visuals ()
  (bound-and-true-p linum-mode))
(defun toggle-show-visual ()
  (interactive)
  (let* ((activated (is-show-visuals))
         (toggle (or (and activated 0) 1)))
    (show-visuals toggle)))

(add-hook 'prog-mode-hook (lambda () (show-visuals 1)))

(custom-set-faces
 '(default ((t (:foreground "black" :slant normal))))
 '(whitespace-space ((t (:background nil :foreground "#DDDDDD"))))
 '(which-func ((t (:foreground "black" :weight normal)))))
