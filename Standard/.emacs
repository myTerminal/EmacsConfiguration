;;;;;;;;;;;;;;;;;;;;;;;; Repositories ;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)

;Add marmalade package repository
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

;Add melpa package repository
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;; User Settings ;;;;;;;;;;;;;;;;;;;;;;;;

;Set author-name
(setq user-full-name "Ismail Ansari")

;Disable backup
(setq backup-inhibited t)

;Disable auto save
(setq auto-save-default nil)

;Disable splash message, start *scratch* buffer by default
(setq initial-buffer-choice t)
(setq initial-scratch-message "Ready and waiting...\n\n")

;;;;;;;;;;;;;;;;;;;;;;;; Interface Tweaks ;;;;;;;;;;;;;;;;;;;;;;;;

;Disable tool-bar
(tool-bar-mode -1)

;Disable scroll-bar
(scroll-bar-mode -1)

;Change cursor-type
(set-default 'cursor-type 'hbar)

;Activate deeper-blue color-theme
(load-theme 'monokai t)

;Set font
(custom-set-faces
 '(default ((t (:family "Inconsolata" :height 140)))))

;Set zoning preferences
(require 'zone)
(setq zone-programs [zone-pgm-putz-with-case])
(defun set-zoning ()
  "Sets zoning timeout"
  (interactive)
  (zone-when-idle 20)
  (message "Zoning set"))

;Enable ido-mode
(ido-mode 1)

;Enable column-number mode
(column-number-mode)

;Enable show-paren-mode
(show-paren-mode)

;Enable highlighting on current line
(global-hl-line-mode 1)

;Enable winner-mode
(winner-mode t)

;;;;;;;;;;;;;;;;;;;;;;;; Libraries ;;;;;;;;;;;;;;;;;;;;;;;;

;Load alpha
(require 'alpha)

;Load multiple-cursors
(add-to-list 'load-path 
	     "~/.emacs.d/other-plugins/multiple-cursors/")
(require 'multiple-cursors)

;Load auto-complete, set dictionary
(add-to-list 'load-path 
	     "~/.emacs.d/other-plugins/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories 
	     "~/.emacs.d/other-plugins/auto-complete-1.3.1/dict")
(ac-config-default)

;Set hook for ac-js2-mode
(add-hook 'js2-mode-hook 'ac-js2-mode)

;Set inferior program command for js-comint
(setq inferior-js-program-command "node --interactive")

;Load autopair, start by default
(require 'autopair)
(autopair-global-mode)

;Set up linum-mode
(global-nlinum-mode t)

;Load e2wm
(require 'e2wm)

;Start undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;Set up markdown mode
(autoload 'markdown-mode 
  "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist 
	     '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist 
	     '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist 
	     '("\\.md\\'" . markdown-mode))

;Load dirtree
(require 'dirtree)

;Set up ace-jump-mode
(autoload 'ace-jump-mode 
  "ace-jump-mode" 
  "Emacs quick move minor mode"
  t)
(autoload 'ace-jump-mode-pop-mark 
  "ace-jump-mode" 
  "Ace jump back:-"
  t)

;Add hooks for column-enforce-mode
(add-hook 'emacs-lisp-mode-hook 
	  'column-enforce-mode)
(add-hook 'js2-mode-hook
	  'column-enforce-mode)

;Enable anzu-mode
(global-anzu-mode +1)

;Set up haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'inf-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-to-list 'completion-ignored-extensions ".hi")

;Load theme-looper
(add-to-list 'load-path
	     "~/.emacs.d/other-plugins/theme-looper")
(require 'theme-looper)
(tl:set-theme-set (list 'wombat
                        'monokai
                        'deeper-blue 
			'wheatgrass))

;Load meta-presenter
(add-to-list 'load-path
	     "~/.emacs.d/other-plugins/meta-presenter")
(require 'meta-presenter)

;;;;;;;;;;;;;;;;;;;;;;;; Jabber ;;;;;;;;;;;;;;;;;;;;;;;;

(setq jabber-account-list
      '(("ismaila@citiusim.mumbai1.corp.citiustech.com" 
	 (:network-server . "citiusim.mumbai1.corp.citiustech.com"))
        ("team.terminal@gmail.com" 
	 (:network-server . "talk.google.com")
	 (:connection-type . ssl))))

(setq jabber-alert-presence-message-function 
      (lambda (who 
               oldstatus 
               newstatus 
               statustext) 
        nil))

(defun custom-notification-for-jabber
    nil)

(add-hook 'jabber-alert-message-hooks
          'custom-notification-for-jabber)

(defun flash-screen ()
  (invert-face 'default)
  (run-at-time 0.25
               nil
               (lambda (x)
                 (invert-face 'default))
               t))

(defun switch-to-visual-notification-for-jabber ()
  (setq visible-bell
        nil)
  (fset 'custom-notification-for-jabber
        (lambda (from
                 buffer
                 text
                 propsed-alert)
          (flash-screen))))

(defun switch-to-taskbar-notification-for-jabber ()
  (setq visible-bell
        t)
  (fset 'custom-notification-for-jabber
        (lambda (from
                 buffer
                 text
                 propsed-alert)
          (ding))))

(switch-to-visual-notification-for-jabber)

(add-hook 'focus-in-hook 'switch-to-visual-notification-for-jabber)
(add-hook 'focus-out-hook 'switch-to-taskbar-notification-for-jabber)

;;;;;;;;;;;;;;;;;;;;;;;; Miscellaneous ;;;;;;;;;;;;;;;;;;;;;;;;

;Enforce spaces for indentation, instead of tabs
(setq-default indent-tabs-mode nil)

;Add js2-mode as the major mode for JavaScript editing
(add-to-list 'auto-mode-alist 
	     '("\\.js\\'" . js2-mode))

;Transpose line up
(defun move-line-up ()
  "Move the current line up by one step"
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

;Transpose line down
(defun move-line-down ()
  "Move the current line down by one step"
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

;Evaluate and replace
(defun eval-and-replace ()
  "Replace expression to the left with it's value in the current buffer"
  (interactive)
  (backward-kill-sexp)
  (prin1 (eval (read (current-kill 0)))
	 (current-buffer)))

;;;;;;;;;;;;;;;;;;;;;;;; Key-bindings ;;;;;;;;;;;;;;;;;;;;;;;;

(defvar my-keyboard-bindings (list '("C-~" . set-zoning)
                                   '("C-!" . zone-leave-me-alone)
				   '("C-M-)" . transparency-increase)
				   '("C-M-(" . transparency-decrease)
				   '("C-}" . mc/mark-next-like-this)
				   '("C-{" . mc/mark-previous-like-this)
				   '("C-|" . mc/mark-all-like-this)
				   '("C-M-]" . e2wm:start-management)
				   '("C-M-[" . e2wm:stop-management)
				   '("M-/" . undo-tree-visualize)
				   '("C->" . ace-jump-mode)
				   '("C-<" . ace-jump-mode-pop-mark)
				   '("C-\"" . tl:enable-next-theme)
				   '("M-<down>" . move-line-down)
				   '("M-<up>" . move-line-up)
				   '("C-=" . eval-and-replace)
                                   '("M-y" . browse-kill-ring)
                                   '("M-x" . smex)
                                   '("C-c C-c M-x" . execute-extended-command)))

(defun apply-keyboard-bindings (pair)
  (global-set-key (kbd (car pair)) (cdr pair)))

(mapc 'apply-keyboard-bindings
      my-keyboard-bindings)
