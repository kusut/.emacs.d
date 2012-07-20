(show-paren-mode t)
(setq backup-inhibited t)
(setq auto-save-default nil)
(global-font-lock-mode t)
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)

(setq jabber-account-list '(("kusut@jabber.org")))

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(load-theme 'zenburn t)
(custom-set-faces
 '(flymake-warnline ((((class color )) (:background "#4f4f4f" :weight normal :underline nil))))
 '(flymake-errline ((((class color )) (:background "#8c5353" :weight normal :underline nil)))))
