(progn
  '(;;Zoning
    ("C-~" mt/interface/set-zoning)
    ("C-!" zone-leave-me-alone)
    ;;Buffer/Window management
    ("C-x C-b" ibuffer)
    ("C-x b" ivy-switch-buffer)
    ("C-x C-f" counsel-find-file)
    ("C-x C-r" counsel-recentf)
    ("C-S-<up>" buf-move-up)
    ("C-S-<down>" buf-move-down)
    ("C-S-<left>" buf-move-left)
    ("C-S-<right>" buf-move-right)
    ("C-%" window-shaper-mode)
    ("C-;" ace-window)
    ;;Text-editing
    ("C-}" mc/mark-next-like-this)
    ("C-{" mc/mark-previous-like-this)
    ("C-|" mc/mark-all-like-this)
    ("C-#" display-line-numbers-mode)
    ("C-c C-SPC" outer-spaces-mode)
    ("C-M-|" indent-guide-mode)
    ("C-*" eagle-eye-mode)
    ("M-/" undo-tree-visualize)
    ("M-y" counsel-yank-pop)
    ("M-<down>" mt/move-line-down)
    ("M-<up>" mt/move-line-up)
    ("C-<backspace>" mt/delete-word-backward)
    ("M-<backspace>" mt/delete-word-backward)
    ("M-S" swiper)
    ("<f5>" mt/reload-current-file)
    ;;Navigation
    ("C->" ace-jump-mode)
    ("C-<" ace-jump-mode-pop-mark)
    ("C-\," neotree-toggle)
    ("C-x p" projectile-mode)
    ("C-c C-p s o" projectile-find-all-occurrences)
    ("C-c C-p s f" projectile-find-all-references)
    ("C-\\" wg-switch-to-previous-workgroup)
    ;;Swanking
    ("C-M-)" transparency-increase)
    ("C-M-(" transparency-decrease)
    ("C-x ~" sublimity-mode)
    ;;Misc
    ("C-c \\" wdired-change-to-wdired-mode)
    ("C-c c M-x" execute-extended-command)
    ("C-c M-x" smex)
    ("M-x" counsel-M-x)
    ("C-)" theme-looper-enable-next-theme)
    ("C-(" theme-looper-enable-previous-theme)
    ("C-M-'" myterminal-controls-open-controls)
    ("C-." emacs-home-show)
    ("C-$" mt/remove-formatting)
    ("C-=" mt/eval-and-replace)
    ("C-c e" quickrun)
    ("C-c r" quickrun-region)
    ("C-c w" quickrun-replace-region)
    ("C-x C-g" mt/jabber/dismiss-jabber-notification)))

(defun mt/key-bindings/apply-keyboard-bindings ()
  (mapc (lambda (item)
          (global-set-key (kbd (car item))
                          (cadr item)))
        mt/key-bindings/key-bindings))
