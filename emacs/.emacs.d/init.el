;; Set up custom.el file to hold customizations
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
	   (file-exists-p custom-file))
  (load custom-file nil :nomessage))
;; Bootstrap crafted-emacs in init.el
(load "~/Dropbox/3-areas/config/crafted-emacs/modules/crafted-init-config")
;; Add package definitions for completion packages to `package-selected-packages.
(require 'crafted-completion-packages)

;; Manually select "ef-themes" package
(add-to-list 'package-selected-packages 'ef-themes)

;; Install the packages listed in `package-selected-packages' list.
(package-install-selected-packages :noconfirm)

;; Load configuration for the completion module
;; REL 20250608 turn this off
;(require 'crafted-completion-config)

;; Enable global auto revert mode
(global-auto-revert-mode 1)

;; spelling via aspell
(setq ispell-program-name "/opt/homebrew/bin/aspell")

;; Remember recently-edited files
;; Source: https://systemcrafers.net/eamcs-from-scratch/the-best-default-settings/
;; M-x recentf-open-files will show list of recent files
;; M-x recentf-open open a file from that list
(recentf-mode 1)

;; Remember minibuffer prompt history and an eshell buffer
;; Source: heepts://systemcrafters.net/emacs-from-scratch/the-best-default-settings/
;; M-n (next-history-element)
;; M-p (previous-history-element)
(setq  history-length 25)
(savehist-mode 1)

;; Remember the last place you visited in a file
;; Source: https://systemcrafters.net/emacs-from-scratch/the-best-default-settings/
(save-place-mode 1)

;; Un-implement suspend frame
(global-unset-key (kbd "C-z")); suspend frame

;; ref: https://www.howardsim.org/Technical/Emacs/eshell-fun.html
(defun eshell-here ()
  "Open a new shell in the directory associated with the current buffer's file. The eshell is renamed to match that directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
		     (file-name-directory (buffer-file-name))
		   default-directory))
	 (height (/ (window-total-height) 3))
	 (name (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)

(defun eshell/x ()
  "Command x exits and closes the eshell window but retains the buffer"
  (insert "exit")
  (eshell-send-input)
  (delete-window))

;; set up all files
(global-display-line-numbers-mode t)

;; set up org-mode files
(add-hook 'org-mode-hook #'visual-line-mode)
