(require 'package)
(remove-hook 'elpy-modules 'elpy-module-flymake)

;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://stable.melpa.org/packages/") t)

;; basic initialization, (require) non-ELPA packages, etc.
(setq package-enable-at-startup nil)
(package-initialize)
;; (require) your ELPA packages, configure them as normal

;; org mode keys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cl" 'org-agenda)
(global-set-key "\C-cl" 'org-capture)
(global-set-key "\C-cl" 'org-iswitchb)

;; resizing windows
; go to windows and use these keys
(global-set-key (kbd "S-C-<left>")  'shrink-windows-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-windows-horizontally)
(global-set-key (kbd "S-C-<down>")  'shrink-window)
(global-set-key (kbd "S-C-<up>")    'enlarge-window)

;; setup Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
   (setq-default flycheck-flake8-maximum-line-length 120))
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq inhibit-splash-screen t)  ;; don't display splash screen on startup
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue)))
 '(save-place t nil (saveplace))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
