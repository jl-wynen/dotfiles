;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Theme for Emac's smart mode line
;;;
;;; Author: Jan-Lukas Wynen
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftheme smart-mode-line-aiphi)

(defface mode-line-adaptive-default
  '((t :background "#cyan"))
  "Default face for adaptive mode line part."
  :group 'mode-line-faces)
(defface mode-line-adaptive-overwrite
  '((t :background "orange"))
  "Face for adaptive mode line part when overwrite mode is enabled."
  :group 'mode-line-faces)
(defface mode-line-adaptive-minibuffer-active
  '((t :background "green"))
    "Face for adaptive mode line part when minibuffer is active."
  :group 'mode-line-faces)

(defface mode-line-adaptive
  '((t :inherit mode-line-adaptive-default))
  "Face for part of the mode line that can be adapted to indicate important changes."
  :group 'mode-line-faces)
(defface mode-line-static
  '((t :inherit mode-line))
  "Face for part of the mode line that stays the same as opposed to mode-line-adaptive."
  :group 'mode-line-faces)


(custom-theme-set-faces
 'smart-mode-line-aiphi

 '(mode-line ((t :background "grey" :foreground "black")))
 '(mode-line-inactive ((t :foreground "white" :background "black" :inverse-video nil :slant italic :box (:line-width -1 :style pressed-button))))

 '(sml/global ((t :foreground "black" :background nil :inverse-video nil)))

 '(mode-line-adaptive-default ((t :background "#00549f" :foreground "white")))
 '(mode-line-adaptive-overwrite ((t :background "OrangeRed2" :foreground "white" :inverse-video nil)))
 '(mode-line-adaptive-minibuffer-active ((t :background "#497a2d" :foreground "white" :inverse-video nil)))

 '(mode-line-adaptive ((t :inherit mode-line-adaptive-default)))
 '(mode-line-static ((t :background nil)))

 '(sml/line-number       ((t :inherit mode-line-adaptive :foreground "white" :weight bold)))
 '(sml/numbers-separator ((t :inherit mode-line-adaptive)))
 '(sml/col-number        ((t :inherit mode-line-adaptive)))
 '(sml/mule-info         ((t :inherit mode-line-adaptive)))
 '(sml/not-modified      ((t :inherit mode-line-adaptive)))
 '(sml/read-only         ((t :inherit mode-line-adaptive :foreground "LawnGreen")))
 '(sml/modified          ((t :inherit mode-line-adaptive :foreground "white" :weight bold)))
 '(sml/outside-modified  ((t :inherit mode-line-adaptive :foreground "firebrick" :background "black" :weight bold )))
 '(sml/remote            ((t :inherit mode-line-adaptive)))

 '(mode-line-buffer-id ((t :inherit mode-line :background "grey")))
 '(sml/prefix          ((t :inherit mode-line :background "grey" :foreground "black")))
 '(sml/folder          ((t :inherit mode-line :background "grey" :foreground "black")))
 '(sml/filename        ((t :inherit mode-line :background "grey" :foreground "#a11035" :weight bold)))

 '(sml/name-filling        ((t :inherit mode-line-static)))
 '(sml/position-percentage ((t :inherit mode-line-static)))
 '(sml/sudo                ((t :inherit mode-line-static :foreground "#a11035")))
 '(sml/vc                  ((t :inherit mode-line-static :foreground "#00549f")))
 '(sml/vc-edited           ((t :inherit mode-line-static :foreground "#00549f")))
 '(sml/git                 ((t :inherit mode-line-static :foreground "#00549f")))
 '(sml/process             ((t :inherit mode-line-static :foreground "#497a2d")))
 '(sml/modes               ((t :inherit mode-line-static)))
 '(sml/minor-modes         ((t :inherit mode-line-static)))
 )

(custom-theme-set-variables
 'smart-mode-line-aiphi
 '(sml/modified-char "+")
 `(sml/outside-modified-char ,(char-to-string (if (char-displayable-p ?×) ?× ?!)))

 ;; put some spaces between adaptive and static parts
 '(sml/pre-id-separator '(""
                          (:propertize " " face mode-line-adaptive)
                          (:propertize " " face mode-line)
                          ))
 '(sml/pos-id-separator '(""
                          (:propertize " " face mode-line)
                          ))

 ;; put brackets around minor modes
 '(sml/pre-minor-modes-separator "[")
 '(sml/pos-minor-modes-separator " ]")
 )


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'smart-mode-line-aiphi)
