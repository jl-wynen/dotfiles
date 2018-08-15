;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Custom keybindings for Emacs
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defvar jl/keys-minor-mode-map (make-keymap))

;; TODO put this into specific major modes and use C-c C-c instead
(define-key jl/keys-minor-mode-map (kbd "<C-M-return>") 'compile)
(define-key jl/keys-minor-mode-map (kbd "M-^") 'shell-command)
(define-key jl/keys-minor-mode-map (kbd "C-d") 'jl/comment-dwim)
(define-key jl/keys-minor-mode-map (kbd "C-x p") 'delete-window)
(define-key jl/keys-minor-mode-map (kbd "M-g s") 'magit-status)

(define-key jl/keys-minor-mode-map [M-left] 'tabbar-backward-tab)
(define-key jl/keys-minor-mode-map [M-right] 'tabbar-forward-tab)
(define-key jl/keys-minor-mode-map [(meta shift left)] 'tabbar-backward-group)
(define-key jl/keys-minor-mode-map [(meta shift right)] 'tabbar-forward-group)

(define-key jl/keys-minor-mode-map (kbd "<f12>") 'ff-find-other-file)
(define-key jl/keys-minor-mode-map (kbd "<f11>") 'toggle-frame-fullscreen)

(define-key jl/keys-minor-mode-map (kbd "C-x <left>") (jl/ignore-error-wrapper 'windmove-left))
(define-key jl/keys-minor-mode-map (kbd "C-x <right>") (jl/ignore-error-wrapper 'windmove-right))
(define-key jl/keys-minor-mode-map (kbd "C-x <up>") (jl/ignore-error-wrapper 'windmove-up))
(define-key jl/keys-minor-mode-map (kbd "C-x <down>") (jl/ignore-error-wrapper 'windmove-down))

(define-key jl/keys-minor-mode-map (kbd "C-c s") 'jl/switch-to-speedbar)
(define-key jl/keys-minor-mode-map (kbd "C-c d") 'sr-speedbar-toggle)


(define-minor-mode jl/keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t "Jl/Keys" 'jl/keys-minor-mode-map)

(jl/keys-minor-mode 1)


;;; disable mode in minibuffer
(defun jl/disable-keys-minibuffer ()
  (jl/keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'jl/disable-keys-minibuffer)
