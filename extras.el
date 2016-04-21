(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(put 'erase-buffer 'disabled nil)
;; AUTOSAVE
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(ido-mode 1)
