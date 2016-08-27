(require 'package)

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
  :init (global-flycheck-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)