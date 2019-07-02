(require 'helm-gtags)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t)

(defun c/bindings()
  (define-key c-mode-map (kbd "RET") 'newline-and-indent)
  (define-key c-mode-map (kbd "C-c TAB") 'company-complete)
  (define-key c-mode-map (kbd "C-c SPC") 'helm-company)
  (define-key c-mode-map (kbd "C-c i") 'helm-semantic-or-imenu)
  (define-key helm-gtags-mode-map (kbd "C-M-a") 'beginning-of-defun)
  (define-key helm-gtags-mode-map (kbd "C-M-e") 'end-of-defun)
  (define-key helm-gtags-mode-map (kbd "C-c g a")
    'helm-gtags-tags-in-this-function)
  (define-key helm-gtags-mode-map (kbd "C-c g r")
    'helm-gtags-resume)
  (define-key helm-gtags-mode-map (kbd "C-c g s")
    'helm-gtags-show-stack)
  (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
  (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history))

(defun c/style()
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 8)
  (setq-local c-indent-level 8)
  (setq-local c-brace-imaginary-offset 0)
  (setq-local c-brace-offset -8)
  (setq-local c-argdecl-indent 8)
  (setq-local c-label-offset -8)
  (setq-local c-continued-statement-offset 8)
  (setq-local backward-delete-char-untabify-method 'hungry)
  (setq-local c-basic-offset 8)
  (setq-local c-default-style "linux"))

(defun c/modes()
  (ws-butler-mode 1)
  (semantic-mode 1)
  (global-semantic-stickyfunc-mode 1)
  (global-semantic-idle-summary-mode 1)
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function)
  (eldoc-mode 1)
  (helm-gtags-mode 1)
  (setq-local company-idle-delay nil) ; no invoke automatically
  (auto-complete-mode 0)
  (company-mode 1)
  (smartparens-global-strict-mode 1))

(defun c/hook ()
  (c/bindings)
  (c/style)
  (c/modes))

(add-hook 'c++-mode-hook 'c/hook)
(add-hook 'asm-mode-hook 'c/hook)
(add-hook 'c-mode-hook 'c/hook)

