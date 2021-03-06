;; install packages
(require 'package)

(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)

(package-initialize)
(when
    (not package-archive-contents)
  (package-refresh-contents)
  )

(defvar myPackages
  '(better-defaults
    elpy
    flycheck ;; uses flake8 (install via anaconda)
    ;;material-theme
    )
  )

(mapc
 #'(lambda (package)
     (unless (package-installed-p package)
       (package-install package))
     )
 myPackages
 )

(elpy-enable)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode)
  )

;;(add-to-list 'flycheck-checkers 'flake8')
(setq-default flycheck-flake8-maximum-line-length 120)

;; basic customization
(setq inhibit-startup-message t)
(load-theme 'material t)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; auto fill
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook  'turn-on-auto-fill)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier 10 Pitch" :foundry "bitstream" :slant normal :weight normal :height 83 :width normal)))))
