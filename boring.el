(require 'color-theme)

;foregrounds
(defvar gainsboro "#dcdcdc")
(defvar pearlaqua "#88d8c0")
(defvar blue "#7ea4cd")
(defvar slategray "#708090")
(defvar wisteria "#c9a0dc")
(defvar papayawhip "#ffefd5")

;backgrounds
(defvar bg "#343434")
(defvar gray "#595959")


(defun boring ()
  (interactive)
  (color-theme-install
   (list
	'boring

     `((background-color . ,bg)
	   (background-mode . dark)
	   (border-color . ,bg)
	   (cursor-color . ,gainsboro)
	   (foreground-color . ,gainsboro)
	   (mouse-color . ,bg))

	 `(plain ((t (:foreground ,gainsboro))))
	 `(reserved ((t (:foreground ,blue))))
	 `(comment ((t (:foreground ,slategray))))
	 `(funclass ((t (:foreground ,pearlaqua))))
	 `(consvar ((t (:foreground ,papayawhip))))
	 `(literal ((t (:foreground ,wisteria))))
	 '(exception ((t (:inherit literal :bold t))))

	 `(hilite ((t (:background ,gray))))
	 
     `(fringe ((t (:background ,bg))))
     `(mode-line ((t (:foreground ,gainsboro :background ,gray))))
     '(region ((t (:inherit hilite))))
	 '(flymake-errline ((t (:inherit hilite))))
	 '(minibuffer-prompt ((t (:inherit reserved :bold t))))

     '(font-lock-builtin-face ((t (:inherit reserved))))
	 '(font-lock-keyword-face ((t (:inherit reserved :bold t))))
     '(font-lock-function-name-face ((t (:inherit funclass))))
     '(font-lock-type-face ((t (:inherit funclass :bold t))))
     '(font-lock-comment-face ((t (:inherit comment))))
     '(font-lock-string-face ((t (:inherit literal))))
	 '(font-lock-variable-name-face ((t (:inherit consvar))))
	 '(font-lock-constant-face ((t (:inherit consvar :bold t))))
	 '(font-lock-warning-face ((t (:inherit exception))))

     '(comint-highlight-input ((t (:inherit plain))))
     '(comint-highlight-prompt ((t (:inherit reserved :bold t))))

	 '(eshell-prompt  ((t (:inherit reserved :bold t))))
	 '(eshell-ls-directory ((t (:inherit reserved))))
     '(eshell-ls-executable ((t (:inherit literal))))
	 '(eshell-ls-archive ((t (:inherit consvar))))
	 '(eshell-ls-product ((t (:inherit consvar :bold t))))
	 '(eshell-ls-symlink ((t (:inherit funclass))))
	 '(eshell-ls-special ((t (:inherit funclass :bold t))))
	 '(eshell-ls-unreadable ((t (:inherit comment :bold t))))
	 '(eshell-ls-missing ((t (:inherit comment :bold t))))
     '(eshell-ls-backup ((t (:inherit comment))))
     '(eshell-ls-clutter ((t (:inherit comment))))


	 '(isearch ((t (:inherit hilite :bold t))))
	 `(isearch-lazy-highlight-face ((t (:background ,gray))))

	 '(erc-action-face ((t (:inherit plain))))
	 '(erc-default-face ((t (:inherit plain))))
     '(erc-input-face ((t (:inherit plain))))
	 '(erc-notice-face ((t (:inherit comment))))
	 '(erc-nick-default-face ((t (:inherit funclass))))
	 '(erc-nick-msg-face ((t (:inherit funclass))))
	 '(erc-my-nick-face ((t (:inherit funclass :bold t))))
	 '(erc-current-nick-face ((t (:inherit funclass :bold t))))
     '(erc-timestamp-face ((t (:inherit consvar))))
     '(erc-prompt-face ((t (:inherit consvar))))
     '(erc-direct-msg-face ((t (:inherit reserved))))
	 '(erc-error-face ((t (:inherit exception))))
     )))

(setq frame-background-mode 'dark) ;for rst
(provide 'boring)
