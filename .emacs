;; define where the .el files are
(add-to-list 'load-path "/home/roy/Dropbox/emacs-el")

;; revert buffer automatically
(global-auto-revert-mode 1)

;; .m files are in octave mode (note: Matlab mode is also available)
(autoload 'octave-mode "octave-mod" nil t)
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))
; turn on abbrevs, auto-fill, and font-lock features automatically
(add-hook 'octave-mode-hook
          (lambda () 
            (abbrev-mode 1)
            (auto-fill-mode 1)
            (if (eq window-system 'x) (font-lock-mode 1))))

;; enable markdown mode
(autoload 'markdown-mode "markdown-mode" "Markdown editing mode." t)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

;; enable lau mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; do not display splash screen
(setq inhibit-splash-screen t)

;; use spaces instead of tabs in certain modes
(setq c-mode-hook
      (function (lambda ()
		  (setq indent-tabs-mode nil)
		  (setq c-indent-level 4))))
(setq c++-mode-hook
      (function (lambda ()
		  (setq indent-tabs-mode nil)
		  (setq c-indent-level 4))))
(setq lau-mode-hook
      (function (lambda ()
		  (setq indent-tabs-mode nil)
		  (setq c-indent-level 4))))

;; never use tabs by default
(setq-default indent-tabs-mode nil)

;; initial window size
(add-to-list 'default-frame-alist '(height . 90))
(add-to-list 'default-frame-alist '(width . 80))

;; do not edit below this line
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 90 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
