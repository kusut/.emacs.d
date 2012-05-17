(global-set-key [f12] 'toggle-truncate-lines)

;require nxhtml
(global-set-key [f8] 'django-nxhtml-mumamo-mode)
(global-set-key [f7] 'mako-nxhtml-mumamo-mode)

;require flymake setup
(global-set-key [f5] 'flymake-goto-prev-error)
(global-set-key [f6] 'flymake-goto-next-error)

(global-set-key "\M-t" 'pdb-trace)
(global-set-key "\C-w" 'kill-region-or-backward-kill-word)
(global-set-key "\C-x i" 'magit-status)
