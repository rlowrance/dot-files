;; Set up custom.el file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
	   (file-exists-p custom-file))
  (load custom-file nil :nomessage))
;; Bootstrap crafter emacs in init.el
(load "~/Dropbox/3-areas/config/crafted-emacs/modules/crafted-init-config")
;; Add package definitions for completion packages
(require 'crafted-completion-packages)

;; Manually select "ef-themes" package
(add-to-list 'package-selected-packages 'ef-themes)

;; Install packages
(package-install-selected-packages :noconfirm)

;; Load configuation for the competion module
;; REL 20250608 don't
;(require 'crafted-completion-config)

;; Automatically revert buffers for changed files
;; Source: https://systemcrafters.net/emacs-from-scratch/the-best-default-settings/
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t) ;; autorevert Dired and other non-file buffers

;; spelling via aspell
(setq ispell-program-name "/opt/homebrew/bin/aspell")

;; Remember recently-edited files
;; Source: https://systemcrafters.net/emacs-from-scratch/the-best-default-settings/
;; M-x recentf-open-files will show list of of recent files
;; M-x recentf-open: open a file from that list
;; The file menu has a selection to see recent files
(recentf-mode 1)

;; Remember minibuffer prompt history and an eshell buffer
;; Source: https://systemcrafters.net/emacs-from-scratch/the-best-default-settings/
;; M-n (next-history-element)
;; M-p (nprevious-history-element)
(setq history-length 25)
(savehist-mode 1)

;; Remember the last place you visited in a file
;; Source: https://systemcrafters.net/emacs-from-scratch/the-best-default-settings/
(save-place-mode 1)

;; Un-implement suspend frame
(global-unset-key (kbd "C-z"))  ; Suspend frame

;; ref: https://www.howardism.org/Technical/Emacs/eshell-fun.html
(defun eshell-here ()
  "Open a new shell in the directory associated with current buffer's file. The eshell is renamed to match that directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
		     (file-name-directory (buffer-file-name))
		   default-directory))
	 (height (/ (window-total-height) 3))
	 (name (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)
!
(defun eshell/x ()
  "Command x exits the closes the eshell window but retains the buffer"
  (insert "exit")
  (eshell-send-input)
  (delete-window))
