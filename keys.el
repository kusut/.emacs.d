(fset 'pdb-trace "import pdb; pdb.set_trace()")

(defun toggle-sgml-indent ()
  (interactive)
  (message "sgml basic offset = %s"
           (setq sgml-basic-offset (if (= sgml-basic-offset 2) 4 2)) ))

(defun kill-region-or-backward-kill-word (&optional arg region)
  (interactive (list (prefix-numeric-value current-prefix-arg) (use-region-p)))
  (if region 
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))

(defun copy-region-or-copy-line (&optional arg region)
  (interactive (list (prefix-numeric-value current-prefix-arg) (use-region-p)))
  (if region
      (kill-ring-save (region-beginning) (region-end))
    (progn
      (kill-ring-save (line-beginning-position) (line-beginning-position 2))
      (message "Line copied"))))

(defun upgrade-packages ()
  (interactive)
  (get-packages))

(global-set-key [f12] 'toggle-truncate-lines)
(global-set-key [f11] 'toggle-sgml-indent)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "C-c p") 'upgrade-packages)
(global-set-key (kbd "C-c C-p") 'upgrade-packages)
(global-set-key (kbd "C-w") 'kill-region-or-backward-kill-word)
(global-set-key (kbd "M-w") 'copy-region-or-copy-line)
(global-set-key (kbd "M-t") 'pdb-trace)

(provide 'keys)
