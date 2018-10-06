;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Customize and enable external packages
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;-------------------------------------
;;;             Tabbar-Mode
;;;-------------------------------------
(tabbar-mode t)

;; not covered by theme
(setq-default tabbar-background-color "grey70")

;; Add a buffer modification state indicator in the tab label, and place a
;; space around the label to make it looks less crowded.
(defadvice tabbar-buffer-tab-label (after fixup_tab_label_space_and_flag activate)
  (setq ad-return-value
        (if (and (buffer-modified-p (tabbar-tab-value tab))
                 (buffer-file-name (tabbar-tab-value tab)))
            (concat " + " (concat ad-return-value " "))
          (concat " " (concat ad-return-value " "))
          )
        )
  )

;; called when buffer modification state changed
(defun jl/modification-state-change ()
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update)
  )
(add-hook 'after-save-hook 'jl/modification-state-change)

;; called before the change is made
(defun jl/on-buffer-modification ()
  (set-buffer-modified-p t)
  (jl/modification-state-change)
  )
(add-hook 'first-change-hook 'jl/on-buffer-modification)


;;;-------------------------------------
;;;        Auto-Complete-Mode
;;;-------------------------------------
(ac-config-default)
(setq ac-use-fuzzy t)
(setq ac-ignore-case t)


;;;-------------------------------------
;;;              Magit
;;;-------------------------------------
;; refresh magit buffer when git tree changes
(add-hook 'magit-status-mode-hook
          (lambda ()
            (magit-filenotify-mode)
            ))


;;;-------------------------------------
;;;           SR-Speedbar
;;;-------------------------------------
;; speedbar in the current frame
(defun jl/switch-to-speedbar ()
  "Switch to the speedbar, open it if not already open."
  (interactive)
  (let ((win (get-buffer-window "*SPEEDBAR*")))
    (if win
        (speedbar-refresh)
      (progn (sr-speedbar-open)
             (setq win (get-buffer-window "*SPEEDBAR*"))))
  (select-window (get-buffer-window "*SPEEDBAR*"))))


;;;-------------------------------------
;;;         Smooth-Scrolling
;;;-------------------------------------
(setq smooth-scroll-margin 4)
(setq smooth-scroll-strict-margins t)


;;;-------------------------------------
;;;         Visible-Mark
;;;-------------------------------------
;; (setq visible-mark-max 1)  ; show only the most recent mark
;; (setq visible-mark-faces `(visible-mark-face1))
;; (global-visible-mark-mode t)
