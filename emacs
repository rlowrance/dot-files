; -*- mode: Lisp-*-
(require 'package)
(remove-hook 'elpy-modules 'elpy-module-flymake)

;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://stable.melpa.org/packages/") t)

;; basic initialization, (require) non-ELPA packages, etc.
(setq package-enable-at-startup nil)
(package-initialize)
;; (require) your ELPA packages, configure them as normal

(global-auto-revert-mode 1)  ; always check for changes on disk

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

;; M-o  open indented line below current line
;; M-O  open indented line above current line
;; ref: http://emacsredux.com/blog/2013/06/15/open-line-above/
(defun smart-open-line-above ()
  "Insert empty line above current line. Position cursor in it according to current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key (kbd "M-O") 'smart-open-line-above)

(defun smart-open-line-below()
  "Insert empty line below current line. Position cursor in it according to current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))
(global-set-key (kbd "M-o") 'smart-open-line-below)

;; make folding easier
;; C-c C-h  toggle hide/show for current block
;; C-c C-j  hide all blocks
;; C-u C-c C-j show all blocks
; ref: http://txt.arboreus.com/2012/07/26/easy-folding-in-emacs-for-python.html
(defun hs-enable-and-toggle ()
  (interactive)
  (hs-minor-mode 1)
  (hs-toggle-hiding))
(defun hs-enable-and-hideshow-all (&optional arg)
  "Hide all blocks. If prefix arg is given, show all blocks."
  (interactive "P")
  (hs-minor-mode 1)
  (if arg
      (hs-show-all)
      (hs-hide-all)))
(global-set-key (kbd "C-c C-h") 'hs-enable-and-toggle)
(global-set-key (kbd "C-C C-j") 'hs-enable-and-hideshow-all)

;;;; BELOW ME SET MY EMACS ITSELF, SO DON"T EDIT

      
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
