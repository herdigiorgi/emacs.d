(use-package java-mode
  :mode ("\\.java\\'" . java-mode)
  :init
  (require 'eclim)
  (require 'eclimd)
  (custom-set-variables
   '(eclim-eclipse-dirs '("~/eclipse/eclipse"))
   '(eclim-executable "~/eclipse/eclipse/eclimd"))

  :bind (("C-c TAB" . 'company-eclim))
  )
