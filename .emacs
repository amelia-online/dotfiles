;; ____________________________________________________________________________  -*- lexical-binding: t; -*-
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("f2f7fbafdb70d61c6018a6d902b0f1420400da4d25397a79d0096b36d5a79307"
     "8ca212d6ef076ad444f44bf6e57a9841930cbeb0c3f7d7525a21e20a57a3d7f6"
     "9fb69436c074b82a62b78b8d733e6274d0bd16d156f7b094e2afe4345c040c49"
     "3619faf2541175a2ab46b3177ce7ae8292c32561a508e26c68ed7e772f031bb6"
     "23bc7705abad1aa2b136649990b0ff9f50b1cd1e21c4742ae4d5d26fd3715016"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "b33955472cb61a721c59c705afda11fea906756d38b3c2eba61698f4e3f82897"
     "e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe"
     "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7"
     "e9d47d6d41e42a8313c81995a60b2af6588e9f01a1cf19ca42669a7ffd5c2fde"
     default))
 '(package-selected-packages
   '(clang-format company cyberpunk-theme darcula-theme drag-stuff embark
		  flycheck gnu-indent gruber-darker-theme
		  gruvbox-theme haskell-mode ivy markdown-mode
		  php-mode rust-mode tron-legacy-theme tuareg vertico
		  zig-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (global-display-line-numbers-mode 1)
(tool-bar-mode -1)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://www.melpa.org/packages/") t)

(add-to-list 'default-frame-alist
	     '(font . "Jetbrains Mono"))

(require 'company)
(global-company-mode)

(setq-default c-basic-offset 4)

(use-package vertico
  :ensure t
  :init
  ;; Activate Vertico globally for all minibuffer completions
  (vertico-mode 1))

;; (use-package emacs
;;   :custom
;;   (vertico-multiform-mode)
;;   (context-menu-mode t)
;;   (enable-recursive-minibuffers t))

;; Enable Vertico.
;; (use-package vertico
;;  ;; :custom
;;   ;; (vertico-scroll-margin 0) ;; Different scroll margin
;;   ;; (vertico-count 20) ;; Show more candidates
;;   ;; (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
;;   ;;   │   ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
;;   :init
;;   (vertico-mode))
;; ;;   │ 
;; ;;   │ ;; Persist history over Emacs restarts. Vertico sorts by history position.
;; (use-package savehist
;;   :init
;;   (savehist-mode))
;; ;;   │ 
;; ;;   │ ;; Emacs minibuffer configurations.
;; (use-package emacs
;;   :custom
;;   ;;   │   ;; Enable context menu. `vertico-multiform-mode' adds a menu in the minibuffer
;;   ;;   │   ;; to switch display modes.
;;   (context-menu-mode t)
;;   ;;   │   ;; Support opening new minibuffers from inside existing minibuffers.
;;   (enable-recursive-minibuffers t)
;;   ;;   │   ;; Hide commands in M-x which do not work in the current mode.  Vertico
;;   ;;   │   ;; commands are hidden in normal buffers. This setting is useful beyond
;;   ;;   │   ;; Vertico.
;;   (read-extended-command-predicate #'command-completion-default-include-p)
;;   ;;   │   ;; Do not allow the cursor in the minibuffer prompt
;;   (minibuffer-prompt-properties
;;    '(read-only t cursor-intangible t face minibuffer-prompt)))

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

(global-set-key (kbd "s-<up>") (lambda () (interactive) (scroll-down-command 5)))
(global-set-key (kbd "s-<down>") (lambda () (interactive) (scroll-up-command 5)))

(use-package clang-format
  :ensure t
  :hook (c-mode-common . (lambda () 
                           (add-hook 'before-save-hook #'clang-format-buffer)))
  :hook (c++-mode . (lambda () (add-hook 'before-save-hook #'clang-format-buffer))))


;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (add-hook 'c-mode-hook #'flycheck-mode)
;; (add-hook 'c++-mode-hook #'flycheck-mode)

(defun my/config ()
  (interactive)
  (find-file "~/.emacs")
  )

(defun my/bashrc ()
  (interactive)
  (find-file "~/.zshrc")
  )

(require 'drag-stuff)
(global-set-key (kbd "M-<up>") #'drag-stuff-up)
(global-set-key (kbd "M-<down>") #'drag-stuff-down)
(global-set-key (kbd "M-<left>") #'drag-stuff-left)
(global-set-key (kbd "M-<right>") #'drag-stuff-right)

(add-to-list 'exec-path "/opt/homebrew/bin")
